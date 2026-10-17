-- Vuokrapörssi v0.8 – käyttöoikeuksien LUKUTARKISTUS
-- Vain SELECT-kyselyitä. Ei muuta tietokantaa.
-- 1. Taulujen ja näkymän RLS-asetukset
select schemaname, tablename, rowsecurity
from pg_tables
where schemaname = 'public' and tablename in ('listings','wanted_listings')
order by tablename;

-- 2. Julkisen näkymän turvallisuusasetus
select n.nspname as schema_name, c.relname as view_name, c.reloptions
from pg_class c join pg_namespace n on n.oid = c.relnamespace
where n.nspname = 'public' and c.relname = 'vp_public_listings';

-- 3. RLS-käytännöt
select tablename, policyname, roles, cmd, qual, with_check
from pg_policies
where schemaname = 'public' and tablename in ('listings','wanted_listings')
order by tablename, policyname;

-- 4. Taulujen käyttöoikeudet
select table_name, grantee, privilege_type
from information_schema.role_table_grants
where table_schema = 'public'
  and table_name in ('listings','wanted_listings','vp_public_listings')
  and grantee in ('anon','authenticated')
order by table_name, grantee, privilege_type;

-- 5. Sarakekohtaiset käyttöoikeudet
select table_name, column_name, grantee, privilege_type
from information_schema.column_privileges
where table_schema = 'public'
  and table_name in ('listings','wanted_listings')
  and grantee in ('anon','authenticated')
order by table_name, column_name, grantee;
