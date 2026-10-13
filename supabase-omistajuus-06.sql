-- VUOKRAPÖRSSI 0.6 — yhden ilmoituksen turvallinen tallennus ja hallinta
-- Suorita koko tiedosto Supabase Dashboard > SQL Editor > New query > Run.

alter table public.listings
  add column if not exists owner_id uuid references auth.users(id) on delete cascade;

create index if not exists listings_owner_id_idx on public.listings(owner_id);

alter table public.listings enable row level security;

-- Nollataan listings-taulun vanhat politiikat, jotta vanha avoin INSERT ei jää vahingossa voimaan.
do $$
declare p record;
begin
  for p in select policyname from pg_policies
           where schemaname='public' and tablename='listings'
  loop
    execute format('drop policy if exists %I on public.listings', p.policyname);
  end loop;
end $$;

-- Julkinen käyttäjä näkee vain aktiiviset ilmoitukset.
create policy "vp_public_read_active"
on public.listings for select to anon
using (status = 'active');

-- Kirjautunut näkee julkiset aktiiviset sekä omat ilmoituksensa myös tauolla.
create policy "vp_authenticated_read"
on public.listings for select to authenticated
using (status = 'active' or owner_id = (select auth.uid()));

create policy "vp_insert_own"
on public.listings for insert to authenticated
with check (owner_id = (select auth.uid()));

create policy "vp_update_own"
on public.listings for update to authenticated
using (owner_id = (select auth.uid()))
with check (owner_id = (select auth.uid()));

create policy "vp_delete_own"
on public.listings for delete to authenticated
using (owner_id = (select auth.uid()));

-- Kuvat: bucket voi pysyä julkisena lukua varten, mutta uusia kuvia saa lisätä vain
-- kirjautunut käyttäjä oman käyttäjätunnuksensa mukaiseen kansioon.
do $$
declare p record;
begin
  for p in select policyname from pg_policies
           where schemaname='storage' and tablename='objects'
           and (qual ilike '%listing-images%' or with_check ilike '%listing-images%')
  loop
    execute format('drop policy if exists %I on storage.objects', p.policyname);
  end loop;
end $$;

create policy "vp_images_insert_own_folder"
on storage.objects for insert to authenticated
with check (
  bucket_id = 'listing-images'
  and (storage.foldername(name))[1] = (select auth.uid())::text
);

create policy "vp_images_update_own_folder"
on storage.objects for update to authenticated
using (
  bucket_id = 'listing-images'
  and (storage.foldername(name))[1] = (select auth.uid())::text
)
with check (
  bucket_id = 'listing-images'
  and (storage.foldername(name))[1] = (select auth.uid())::text
);

create policy "vp_images_delete_own_folder"
on storage.objects for delete to authenticated
using (
  bucket_id = 'listing-images'
  and (storage.foldername(name))[1] = (select auth.uid())::text
);

-- Huom: ennen owner_id:n käyttöönottoa tehdyt vanhat ilmoitukset jäävät owner_id=NULL.
-- Niitä ei tämän jälkeen voi kukaan tavallinen käyttäjä muokata tai poistaa.
