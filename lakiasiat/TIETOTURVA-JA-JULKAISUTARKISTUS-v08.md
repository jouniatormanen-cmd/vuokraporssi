# Vuokrapörssi v0.8 – tietoturvan ja julkaisukelpoisuuden tarkistus (17.10.2026)

**Tila: KESKEN – EI JULKISEEN KÄYTTÖÖN.** Tämä raportti perustuu GitHubin koodiin, SQL-tiedostoihin ja aiemmin Supabase SQL Editorista saatuihin käyttäjän tuloksiin. Raportti **ei ole** tuotantotietokannan reaaliaikainen tarkistus tai läpäisty penetraatiotesti. Tuotannon `index.html` ja tietokanta jätetty muuttamatta.

## 1. Jo varmistetut havainnot
- GitHub Pages -testisivu toimii käyttäjän ilmoituksen mukaan. Ilmoitussivun oikean reunan tekstien kontrastikorjaus on käyttäjän hyväksymä.
- Supabasen kirjautumista (Google sekä sähköposti/salasana) ja omien vuokrailmoitusten poistoa on testattu aiemmin, mutta **ei vielä kaikkia toimintoja viimeisimmässä yhdistelmätestiversiossa**.
- Käyttäjä on suorittanut onnistuneesti `REVOKE INSERT, UPDATE, REFERENCES ON TABLE public.listings FROM anon`. Tämä ei yksin rajaa SELECT-oikeuksia.
- Julkinen `vp_public_listings`-näkymä on luotu ja yhdistelmätestisivu käyttää sitä. Näkymä ei itsessään poista suoraa oikeutta lukea `public.listings`-taulua.
- `supabase/v08-rajaa-anon-lukuoikeudet.sql` on **vain tallennettu GitHubiin, ei ajettu Supabasessa**. Siksi aiemmassa oikeusraportissa näkyneen `owner_id`-kentän anonyymi SELECT-oikeus on edelleen ratkaisematon, kunnes uusi tulos osoittaa muuta.

## 2. Tietoturvariskit ja toimenpiteet (prioriteettijärjestys)

### P0 – estävät julkaisun
1. **Anonyymi lukuoikeus.** Tarkista ja rajaa `listings`- ja `wanted_listings`-taulujen `owner_id`-kenttien lukuoikeudet. Tarkista sekä taulu- että sarakekohtaiset GRANT-oikeudet; pelkkä `information_schema.column_privileges`-tulos on tarkistettava huolellisesti myös taulutason oikeuksien osalta. GitHubin valmiin migraation vaikutukset on testattava ensin. **Älä aja migraatiota ennen varmuuskopiota ja palautussuunnitelmaa.**
2. **Omistajuus / RLS.** Testaa anonyymin, käyttäjän A, käyttäjän B ja ylläpitäjän rooleilla: listaus, yksittäinen ilmoitus, uuden luonti, muokkaus, poisto ja hakuilmoitukset. Varmista, ettei A voi käsitellä B:n tietoja muuttamalla HTTP-pyyntöä tai ilmoituksen tunnistetta. Erityisesti tarkista `wanted_listings`-taulun INSERT `WITH CHECK` ja DELETE `USING` aktiivisesta tietokannasta, ei vain GitHubin SQL:stä.
3. **Julkiset yhteystiedot.** Ilmoituksen sähköposti, puhelin ja yhteyshenkilö sekä hakuilmoituksen sähköposti ovat tarkoituksella julkisia nykyisessä mallissa. Varmista julkisuuden selkeä ilmoittaminen **ennen** julkaisemista ja arvioi roskapostin/haravoinnin riski; päätä tarvitaanko yhteydenottolomake tai muu minimointi.
4. **Storage.** Tarkista `listing-images`-bucketin nykyinen julkisuus, INSERT/UPDATE/DELETE-politiikat, käyttäjäkohtaiset kansiot, tiedostotyypit, kokorajat ja poiston yhteydessä orvoiksi jäävät kuvat. GitHubin vanha SQL ei todista nykyistä tilaa.
5. **Tilin poistaminen ja tietojen elinkaari.** Varmista todellinen poistomenettely, ilmoitusten/kuvien käsittely, säilytysajat ja varmuuskopiot. Varmista myös, että vanhoja `owner_id IS NULL` -ilmoituksia voi käsitellä turvallisesti ylläpidossa.
6. **Tuotanto- ja testiversioiden erot.** Varmista, ettei tuotannon `index.html` käytä vanhaa turvatonta REST-kyselyä tai muuta vanhaa toimintoa. Testiversion onnistuminen ei automaattisesti korjaa tuotantoa.

### P1 – ennen ulkopuolista betaa
7. Tarkista Supabase Authin Site URL, sallitut redirect-osoitteet, sähköpostivahvistus, salasanan palautus, OAuth-konfiguraatio ja kirjautumisen väärinkäytön esto. Älä jaa client secretiä tai service_role-avainta sivuston JavaScriptiin.
8. Tarkista lomakekenttien validointi, DOM-sisällön turvallinen esittäminen ja käyttäjien antamat URL-osoitteet/kuvat; sovellus käyttää useissa kohdissa `innerHTML`-rakennetta, joten jokainen dynaaminen kenttä on auditoitava XSS-riskin varalta.
9. Tarkista käytössä olevat kolmannen osapuolen skriptit, Content Security Policy, selaintallennus, istunnon vanheneminen ja uloskirjautuminen.
10. Dokumentoi ylläpitäjän oikeudet, väärinkäytösten ilmoituskanava, lokien säilytys ja tietoturvapoikkeaman toimintamalli.

## 3. Käyttöehdot – luonnos on olemassa
Lähde: `lakiasiat/KAYTTOEHDOT-LUONNOS-v01.md`.
Sisältää palvelun roolin ilmoitusalustana, käyttäjien vastuut, vuokrauksen, kuluttajansuojan, sisällön käsittelyn ja vastuunrajoitukset. **Ei vielä julkaisuvalmis.** Puuttuvat ylläpitäjän tunniste- ja yhteystiedot, yksityinen/yritys-ilmoittaja-valinta, moderointikanava, lain edellyttämät perustelu-/valitusmenettelyt, tilin poisto, hyväksyntätoiminto ja voimaantulo. DSA:n ja mahdollisten markkinapaikkavelvoitteiden soveltuvuus on arvioitava palvelun todellisen toimintamallin perusteella.

## 4. Tietosuojaseloste – luonnos on olemassa
Lähde: `lakiasiat/TIETOSUOJASELOSTE-LUONNOS-v01.md`.
Sisältää alustavat henkilötietoryhmät, käyttötarkoitukset, käsittelyperusteet, vastaanottajat, oikeudet ja tietoturvakuvauksen. **Ei vielä julkaisuvalmis.** Vahvistettava rekisterinpitäjän tiedot ja yhteyskanava, Supabase-projektin alue ja siirrot, käsittelijäsopimukset, täsmälliset säilytysajat, eväste-/localStorage-inventaario, mahdollinen viestitoiminto, oikeutetun edun punninta ja rekisteröityjen oikeuksien toteuttaminen.

## 5. Toteutussuunnitelma
A. Säilytä toimiva testiversio ja tuotanto ennallaan; tee tietokannan varmuuskopio ennen SQL-muutoksia.
B. Varmista oikeudet ja sovella testattua anonyymien sarakeoikeuksien korjausta; tarkista tulos **sekä** suoralla REST-kutsulla **että** käyttäjärooleilla.
C. Testaa Storage, Auth, RLS ja omistajuus sekä tietojen poisto. Kirjaa läpäisy/virhe.
D. Täydennä käyttöehdot ja tietosuojaseloste vain vahvistetuilla tiedoilla, julkaise vasta hyväksymisen ja toteutuksen jälkeen.
E. Lopuksi mobiilitestaus ja erillinen hyväksyntä tuotantoon viemiselle.

## 6. Käyttäjältä myöhemmin tarvittavat tiedot/toimet
- Supabase-projektin SQL Editorissa tehtävä oikeusmuutos ja testitulokset (ei pyydetä nyt, aiempi kopiointi epäonnistui).
- Rekisterinpitäjän / palveluntarjoajan julkiset tunniste- ja yhteystiedot sekä mahdollinen Y-tunnus ja oikeudellinen asema.
- Päätös ilmoitusten yhteystietojen julkisuudesta, säilytysajoista ja laittoman sisällön ilmoituskanavasta.
- Hyväksyntä lopullisille asiakirjoille ja erillinen lupa tuotantoon tehtäville muutoksille.

**Ei tehty:** Supabaseen ei ole suoraa yhteyttä tästä tarkistuksesta, eikä tietokannan nykytilaa, käytössä olevia bucket-politiikkoja tai selaimen ajonaikaista toimintaa ole voitu riippumattomasti vahvistaa. Tämä dokumentti on tarkistusraportti ja etenemissuunnitelma, ei tietoturvasertifikaatti.
