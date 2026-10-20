-- Vuokrapörssi v0.10: turvallinen julkinen ilmoitusnäkymä.
-- VAIHE 1: tämä luo uuden näkymän, eikä muuta vanhan v0.9:n oikeuksia.
-- Suoritetaan Supabase SQL Editorissa ennen uuden v0.10-koodin julkaisemista.
BEGIN;
CREATE OR REPLACE VIEW public.vp_browse_listings
WITH (security_invoker = true)
AS
SELECT
  id, title, category, description, price, city, postal_code,
  price_unit, available_from, available_to, reserved_dates,
  images, status, created_at
FROM public.listings
WHERE status = 'active';
REVOKE ALL ON TABLE public.vp_browse_listings FROM PUBLIC, anon, authenticated;
GRANT SELECT ON TABLE public.vp_browse_listings TO anon, authenticated;
COMMIT;

-- Tarkistus:
-- SELECT grantee, privilege_type FROM information_schema.role_table_grants
-- WHERE table_schema='public' AND table_name='vp_browse_listings'
-- AND grantee IN ('anon','authenticated');
--
-- VAIHE 2 (EI SUORITETA VIELÄ): vanhojen yhteystietosarakeoikeuksien
-- poistaminen vaatii v0.9:n korvaamisen uudella yhteensopivalla koodilla.
-- REVOKE SELECT(contact_name,contact_email,contact_phone)
--   ON public.listings FROM anon;
-- REVOKE SELECT(contact_email) ON public.wanted_listings FROM anon;
