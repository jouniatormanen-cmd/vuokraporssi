-- Vuokrapörssi 0.6: suorita Supabase SQL Editorissa ennen omien ilmoitusten käyttöönottoa.
-- Vanhoja ilmoituksia ei siirretä automaattisesti kenellekään.
alter table public.listings add column if not exists owner_id uuid references auth.users(id);
create index if not exists listings_owner_id_idx on public.listings(owner_id);
alter table public.listings enable row level security;
drop policy if exists "vp_public_read_active" on public.listings;
create policy "vp_public_read_active" on public.listings for select to anon using (status = 'active');
drop policy if exists "vp_user_read_own_or_active" on public.listings;
create policy "vp_user_read_own_or_active" on public.listings for select to authenticated using (status = 'active' or owner_id = (select auth.uid()));
drop policy if exists "vp_user_insert_own" on public.listings;
create policy "vp_user_insert_own" on public.listings for insert to authenticated with check (owner_id = (select auth.uid()));
drop policy if exists "vp_user_update_own" on public.listings;
create policy "vp_user_update_own" on public.listings for update to authenticated using (owner_id = (select auth.uid())) with check (owner_id = (select auth.uid()));
drop policy if exists "vp_user_delete_own" on public.listings;
create policy "vp_user_delete_own" on public.listings for delete to authenticated using (owner_id = (select auth.uid()));
-- TÄRKEÄÄ: poista vanhat laajat anon/authenticated INSERT/UPDATE/DELETE/SELECT
-- -politiikat Supabase Dashboard > Database > Policies > listings.
-- Muuten yllä olevat säännöt eivät yksin estä muiden ilmoitusten muokkaamista.
-- Tallennuskuvien bucketin upload-oikeudet on myös rajattava käyttäjään tuotannossa.
