# Vuokrapörssi v0.10 – Supabase RLS -tarkistuskyselyt

Suorita vain Supabase SQL Editorissa **read-only**-tarkistuksina. Älä julkaise palveluavaimia tai henkilötietoja. Nämä kyselyt eivät muuta tietokantaa.

## RLS-tila
```sql
select schemaname, tablename, rowsecurity, forcerowsecurity
from pg_tables
where schemaname = 'public' and tablename in ('listings','wanted_listings');
```

## Politiikat
```sql
select schemaname, tablename, policyname, permissive, roles, cmd, qual, with_check
from pg_policies
where schemaname = 'public' and tablename in ('listings','wanted_listings')
order by tablename, policyname;
```

## Taulujen käyttöoikeudet
```sql
select table_name, grantee, privilege_type
from information_schema.role_table_grants
where table_schema = 'public'
  and table_name in ('listings','wanted_listings')
  and grantee in ('anon','authenticated','public')
order by table_name, grantee, privilege_type;
```

## Storage-politiikat
```sql
select schemaname, tablename, policyname, roles, cmd, qual, with_check
from pg_policies
where schemaname = 'storage' and tablename = 'objects'
order by policyname;
```

## Storage-bucketin asetukset
```sql
select id, name, public, file_size_limit, allowed_mime_types
from storage.buckets
where id = 'listing-images' or name = 'listing-images';
```

## Hyväksymisportti
- RLS on päällä kaikissa asiakasrajapinnan tauluissa.
- INSERT/UPDATE/DELETE -politiikat rajaavat käyttäjän omiin riveihin myös tietokannassa; tarkista oikea omistajasarakkeen nimi.
- Storage-politiikat estävät toisten tiedostojen muuttamisen ja poistamisen.
- Anon-roolin lukuoikeudet vastaavat tarkoitettua julkista näkyvyyttä.
- Testaa kahdella eri Supabase Auth -käyttäjällä myös suorat REST-pyynnöt.
- Tarkista käyttöehdot, tietosuojaseloste ja yhteystietojen julkaisu.
- Älä yhdistä main-haaraan ilman omistajan hyväksyntää.

Huom: kyselyjen tulokset on arvioitava ennen mahdollisia korjaavia SQL-migraatioita.