-- Vuokrapörssi v0.8: hakuilmoitukset. Suorita Supabase SQL Editorissa vasta tarkistuksen jälkeen.
-- Ei muuta listings-taulua eikä olemassa olevia ilmoituksia.
create table if not exists public.wanted_listings (
 id uuid primary key default gen_random_uuid(),
 owner_id uuid not null references auth.users(id) on delete cascade,
 title text not null check (char_length(trim(title)) between 3 and 120),
 kind text not null check (kind in ('Vuokrattava kohde','Palvelu','Elämys tai kokemus')),
 location text not null check (char_length(trim(location)) between 2 and 100),
 wanted_when text not null default '',
 budget_eur numeric(12,2) check (budget_eur is null or budget_eur >= 0),
 description text not null check (char_length(trim(description)) between 5 and 2000),
 contact_email text not null,
 created_at timestamptz not null default now()
);
alter table public.wanted_listings enable row level security;
revoke all on public.wanted_listings from anon, authenticated;
grant select on public.wanted_listings to anon, authenticated;
grant insert, delete on public.wanted_listings to authenticated;
drop policy if exists "wanted_public_read" on public.wanted_listings;
create policy "wanted_public_read" on public.wanted_listings for select to anon, authenticated using (true);
drop policy if exists "wanted_owner_insert" on public.wanted_listings;
create policy "wanted_owner_insert" on public.wanted_listings for insert to authenticated
with check (owner_id = (select auth.uid()) and contact_email = (select auth.jwt()->>'email'));
drop policy if exists "wanted_owner_delete" on public.wanted_listings;
create policy "wanted_owner_delete" on public.wanted_listings for delete to authenticated
using (owner_id = (select auth.uid()));
create index if not exists wanted_listings_created_at_idx on public.wanted_listings (created_at desc);
create index if not exists wanted_listings_owner_id_idx on public.wanted_listings (owner_id);
-- HUOM: julkinen select näyttää myös contact_email-kentän. Sähköposti on tarkoituksella yhteystieto.
-- Ennen tuotantokäyttöä harkitse yhteystietojen suojausta / välitettyä yhteydenottoa.
