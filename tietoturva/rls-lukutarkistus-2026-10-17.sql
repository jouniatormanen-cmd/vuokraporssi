-- Vuokrapörssi: pelkkä luku / RLS- ja Storage-tarkistus
-- Ei tee muutoksia tietokantaan.
select n.nspname as schema_name,c.relname as table_name,c.relrowsecurity as rls_enabled,c.relforcerowsecurity as rls_forced
from pg_class c join pg_namespace n on n.oid=c.relnamespace
where n.nspname='public' and c.relname in ('listings','wanted_listings','vp_public_listings')
order by c.relname;

select schemaname,tablename,policyname,permissive,roles,cmd,qual,with_check
from pg_policies
where (schemaname='public' and tablename in ('listings','wanted_listings'))
   or (schemaname='storage' and tablename='objects')
order by schemaname,tablename,policyname;

select table_schema,table_name,grantee,privilege_type
from information_schema.table_privileges
where table_schema='public' and table_name in ('listings','wanted_listings','vp_public_listings')
  and grantee in ('anon','authenticated')
order by table_name,grantee,privilege_type;

select table_schema,table_name,column_name,grantee,privilege_type
from information_schema.column_privileges
where table_schema='public' and table_name in ('listings','wanted_listings')
  and column_name='owner_id' and grantee in ('anon','authenticated')
order by table_name,grantee;

select id,name,public,file_size_limit,allowed_mime_types
from storage.buckets where id='listing-images';
