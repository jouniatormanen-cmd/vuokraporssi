-- VUOKRAPÖRSSI v0.8: rajataan kirjautumattoman SELECT-oikeus julkisiin sarakkeisiin.
-- EDELLYTYKSET: public.vp_public_listings -näkymä on olemassa, security_invoker=true;
-- testisivu on julkaistu ja toimii ENNEN SQL:n ajoa.
-- Tarkista RLS ja varmuuskopio. Tämä ei muuta taulurivejä eikä authenticated-roolin oikeuksia.
-- Käyttäjän tarkoituksella julkaisemat yhteystiedot ovat yhä julkisia.
BEGIN;
REVOKE SELECT ON TABLE public.listings FROM anon;
GRANT SELECT (id,title,category,description,price,city,postal_code,price_unit,
              available_from,available_to,reserved_dates,images,contact_name,
              contact_email,contact_phone,status,created_at)
ON TABLE public.listings TO anon;

REVOKE SELECT ON TABLE public.wanted_listings FROM anon;
GRANT SELECT (id,title,kind,location,wanted_when,budget_eur,description,
              contact_email,created_at)
ON TABLE public.wanted_listings TO anon;
COMMIT;

-- Odotettu tulos: nolla riviä; anon ei saa lukea owner_id:tä.
SELECT table_name,column_name,grantee,privilege_type
FROM information_schema.column_privileges
WHERE table_schema='public' AND grantee='anon'
AND table_name IN ('listings','wanted_listings')
AND column_name='owner_id' AND privilege_type='SELECT';

-- HUOM: PostgreSQL RLS rajoittaa näkyviä rivejä, sarakeoikeudet näkyviä kenttiä.
-- Testaa kirjautumattomana vuokrailmoitukset ja hakuilmoitukset;
-- kirjautuneena omien ilmoitusten muokkaus/poisto sekä hakuilmoitusten poisto.
-- Jos testit eivät toimi, keskeytä julkaisu ja selvitä ennen lisämuutoksia.
