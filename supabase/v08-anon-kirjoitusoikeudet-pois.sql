-- Vuokrapörssi v0.8: turvallinen ensimmäinen oikeuksien kiristys
-- Tarkistettu aiemmasta information_schema.column_privileges -raportista.
-- Suorita VAIN Vuokrapörssin Supabase SQL Editorissa varmistettuasi projektin.
-- Ei poista tietoja, tauluja, RLS-käytäntöjä eikä kirjautuneiden oikeuksia.
-- Ei vielä ratkaise owner_id:n julkista SELECT-oikeutta.
BEGIN;
REVOKE INSERT, UPDATE, REFERENCES ON TABLE public.listings FROM anon;
COMMIT;

-- Näytä jäljelle jäävät kirjautumattoman oikeudet.
SELECT grantee, privilege_type
FROM information_schema.role_table_grants
WHERE table_schema = 'public' AND table_name = 'listings' AND grantee = 'anon'
ORDER BY privilege_type;

-- HUOMIO: Jos RLS-käytännöissä on kirjautumattomille kirjoitusoikeuksia,
-- yllä oleva REVOKE estää niiden käyttämisen tämän taulun kautta.
-- Jatkovaiheessa tarkistetaan kaikki RLS-käytännöt, view-oikeudet ja
-- julkisen omistajatunnisteen rajaaminen ilman omien ilmoitusten rikkoutumista.
