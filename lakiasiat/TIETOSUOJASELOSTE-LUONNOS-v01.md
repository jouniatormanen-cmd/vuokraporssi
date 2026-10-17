# Vuokrapörssi – tietosuojaseloste (LUONNOS v0.1)

**Laadittu:** 17.10.2026  
**Tila:** Kehitysvaiheen tarkistusluonnos. EI julkaisuvalmis ennen alla olevien avoimien tietojen vahvistamista.

## 1. Rekisterinpitäjä ja yhteydenotot

Palvelu: **Vuokrapörssi**. Rekisterinpitäjänä toimii palvelun ylläpitäjä yksityishenkilönä. Rekisterinpitäjän lain edellyttämät yksilöinti- ja yhteystiedot: **[vahvistetaan ennen julkaisua]**. Tietosuojapyyntöjen sähköpostiosoite: **[perustetaan ja lisätään ennen julkaisua]**. Pelkkä palvelun nimi ei korvaa rekisterinpitäjän tunnistetietoja.

## 2. Mitä tietoja käsittelemme?

- **Käyttäjätili ja kirjautuminen:** sähköpostiosoite, käyttäjän yksilöllinen tunniste (UID), kirjautumiseen liittyvät tekniset tiedot ja tilin vahvistustiedot. Sähköposti/salasana-kirjautumisen salasanan käsittelee tunnistautumispalvelu; sitä ei julkaista ilmoituksissa.
- **Google-kirjautuminen:** Googlen kautta välittyvät tunnistautumis- ja profiilitiedot sen mukaan, mitä palvelu vastaanottaa ja käyttäjä sallii; tarkka kenttäluettelo tarkistetaan Supabase Authin asetuksista.
- **Oma profiili:** käyttäjän itse antama nimi ja mahdollinen puhelinnumero; palvelussa on myös aiempien paikallisesti tallennettujen profiilitietojen siirtologiikka.
- **Vuokrausilmoitukset:** otsikko, kuvaus, kategoria, hinta, sijainti/postinumero, saatavuuspäivät, kuvat, ilmoituksen tila, ilmoittajan antama yhteyshenkilön nimi, sähköposti ja mahdollinen puhelinnumero sekä omistajatunniste ja julkaisuaika.
- **Hakuilmoitukset:** haettavan kohteen tyyppi, kuvaus, sijainti, ajankohta, mahdollinen budjetti, julkaisuaika ja ilmoittajan sähköpostiosoite.
- **Tekniset tiedot:** palvelun toiminnan ja tietoturvan kannalta välttämättömät yhteys-, kirjautumis-, tapahtuma- ja virhelokit siinä laajuudessa kuin käytetyt palveluntarjoajat niitä keräävät.
- **Mahdolliset yhteydenotot ja viestit:** sisältö ja yhteystiedot, jos käyttäjä lähettää palvelun kautta viestin. Viestitoiminnon todellinen tietovirta ja säilytys on vielä tarkistettava.

Älä kirjoita ilmoituksiin henkilötunnuksia, terveystietoja, maksukorttitietoja tai muita tarpeettomia arkaluonteisia tietoja.

## 3. Miksi käsittelemme tietoja ja millä perusteella?

| Tarkoitus | Alustava GDPR 6 artiklan käsittelyperuste |
|---|---|
| Tilin luonti, kirjautuminen ja oman ilmoituksen hallinta | 6(1)(b), sopimuksen täytäntöönpano |
| Ilmoitusten julkaiseminen ja hakeminen palvelun sovittuna toimintona | 6(1)(b), sopimuksen täytäntöönpano |
| Palvelun tekninen turvallisuus, väärinkäytösten torjunta ja virheiden selvittäminen | 6(1)(f), oikeutettu etu, punninta tehtävä |
| Lakisääteisten velvoitteiden täyttäminen | 6(1)(c), oikeudellinen velvoite, yksilöitävä soveltuva velvoite |
| Mahdollinen ei-välttämätön analytiikka tai markkinointi | Ei käytössä oletuksena; käsittelyperuste ja mahdollinen suostumus arvioitava ennen käyttöönottoa |

**Huomio:** Hakuilmoituksen julkisen yhteyssähköpostin julkaiseminen vaatii erillisen läpinäkyvän käyttöliittymäilmoituksen ja tietosuojan arvioinnin. Lomakkeessa on jo julkisuutta koskeva vahvistusvalinta; sitä ei pidä automaattisesti pitää kaikkien tietojenkäsittelytoimien GDPR-suostumuksena.

## 4. Mitkä tiedot ovat julkisia?

Julkisessa ilmoituksessa voivat näkyä käyttäjän antamat otsikko, kuvaus, kuvat, hinta, sijainti, saatavuus ja ilmoitukseen merkityt yhteystiedot. Hakuilmoitusten sähköpostiosoite voi nykyisessä toteutuksessa olla julkisesti saatavilla tietokantarajapinnan kautta. Julkaistuja tietoja voivat lukea myös kirjautumattomat kävijät ja ne voivat päätyä hakukoneisiin tai kolmansien osapuolten kopioihin.

Käyttäjätilin salasanaa ei julkaista. Käyttäjätunnisteen (UID) mahdollinen näkyvyys julkisen rajapinnan kautta on tarkistettava ja minimoitava ennen julkaisua.

## 5. Kenelle tietoja luovutetaan?

- **Supabase:** käyttäjätunnistus, tietokanta ja ilmoituskuvien tallennus. Supabase käsittelee henkilötietoja palvelun teknisen toteutuksen yhteydessä; sopimus- ja alikäsittelijätiedot tarkistetaan.
- **Google:** Google-kirjautumisen yhteydessä Googlen oma tietojenkäsittely koskee sen tunnistuspalvelua.
- **GitHub Pages:** sivuston staattinen julkaisu; verkkopalvelun tarjoaja voi käsitellä teknisiä käynti- ja palvelinlokitietoja omien käytäntöjensä mukaisesti.
- **Muut kävijät:** julkisesti julkaistut ilmoitustiedot.

Tietoja voidaan luovuttaa viranomaiselle, jos laki sitä edellyttää. Emme väitä, että kaikki palveluntarjoajat toimisivat samassa roolissa tai että kaikki tieto pysyisi Suomessa.

## 6. Tietojen sijainti ja siirrot EU/ETA:n ulkopuolelle

Supabasen ensisijainen tietokanta-, tunnistus- ja tallennusalue riippuu projektin valitusta alueesta: **[tarkistettava Supabase-projektin asetuksista]**. Supabasen mukaan osa tukipalveluista, lokitiedoista ja sisällön jakelusta voi käsitellä tietoja muuallakin kuin ensisijaisella alueella. Supabasen tietojenkäsittelysopimus kuvaa kansainvälisten siirtojen suojatoimia, mukaan lukien vakiosopimuslausekkeet soveltuvissa tilanteissa. Myös Google- ja GitHub-palvelujen tietovirrat on arvioitava.

## 7. Kuinka kauan tietoja säilytetään?

Tietoja säilytetään vain niin kauan kuin niiden käyttötarkoitus tai laki sitä edellyttää. **Tarkat säilytysajat ja poistomenettelyt on vielä päätettävä ja toteutettava:** käyttäjätilit, aktiiviset/poistetut ilmoitukset, ilmoituskuvat, hakuilmoitukset, viestit, tekniset lokit ja varmuuskopiot. Käyttäjän poistaman ilmoituksen tulee lakata näkymästä julkisesti; tekniset varmuuskopiot voivat säilyä rajatun ajan, joka on ilmoitettava.

## 8. Rekisteröidyn oikeudet

Sinulla voi olla oikeus saada tietoa henkilötietojesi käsittelystä, tarkastaa tiedot, pyytää niiden korjaamista tai poistamista, rajoittaa käsittelyä, vastustaa oikeutettuun etuun perustuvaa käsittelyä sekä saada tiedot siirretyksi soveltuvissa tilanteissa. Oikeuksien laajuus riippuu käsittelyperusteesta ja laista. Pyynnöt osoitetaan rekisterinpitäjälle kohdassa 1 ilmoitettuun yhteydenottokanavaan. Käyttäjällä on oikeus tehdä valitus tietosuojavaltuutetulle: https://tietosuoja.fi/.

## 9. Evästeet ja paikallinen tallennus

Supabase Auth säilyttää kirjautumisen istuntotietoja selaimessa. Sivusto käyttää myös paikallista tallennusta eräiden profiilitietojen käsittelyssä. Näiden teknologioiden täsmällinen inventaario ja mahdolliset kolmannen osapuolen evästeet on tarkistettava selaimessa ennen julkaisua. Mahdollinen ei-välttämätön seuranta vaatii erillisen arvioinnin ja tarvittaessa suostumusratkaisun.

## 10. Tietoturva

Käytössä on kirjautuminen ja tietokannan rivikohtaisia käyttöoikeussääntöjä (RLS). Näiden olemassaolo ei yksin osoita, että kaikki tiedot ovat oikein suojattuja. Ennen julkaisua tarkistetaan erityisesti julkisten tietokantakyselyiden palauttamat kentät, käyttäjien väliset käyttöoikeudet, tallennustilan julkisuus, poistotoiminnot ja varmuuskopiot.

## 11. Muutokset

Selostetta päivitetään, kun palvelun ominaisuudet tai tietojenkäsittely muuttuvat. Julkaisupäivä ja versionumero ilmoitetaan valmiissa selosteessa.

---

## JULKAISUN ESTÄVÄ TARKISTUSLISTA

1. Vahvista rekisterinpitäjän lain edellyttämät tiedot ja erillinen tietosuojayhteysosoite.
2. Tarkista Supabase-projektin alue, DPA, alikäsittelijät ja Google/GitHub-tietovirrat.
3. Tarkista **julkisten REST-rajapintojen tietokentät**: etenkin sähköpostit, puhelimet, omistaja-UID:t ja hakuilmoitukset. Minimoi tarpeeton julkinen saatavuus.
4. Päätä ja toteuta säilytysajat, tilin poistaminen, ilmoitusten ja kuvien poistaminen sekä varmuuskopioiden poistumisaikataulu.
5. Selvitä viestitoiminnon toteutunut tietojenkäsittely ja tarkista mahdollinen sähköpostipalvelu.
6. Inventoi evästeet, localStorage ja ulkoiset resurssit; tee tarvittavat käyttäjäilmoitukset ja suostumustoiminnot.
7. Tarkista ja dokumentoi GDPR-oikeusperusteet sekä oikeutetun edun punninta.
8. Tee linkitetty, saavutettava julkinen tietosuojasivu ja lisää se rekisteröitymisen sekä ilmoituslomakkeen yhteyteen.
9. Testaa mobiiliversio ennen ulkopuolista testausta.
10. Tarkistuta lopullinen teksti ja käytännöt tarvittaessa tietosuoja-asiantuntijalla.

### Lähteet

- GDPR (EU) 2016/679, erityisesti artiklat 5, 6, 12–14, 15–22, 28 ja 32: https://eur-lex.europa.eu/eli/reg/2016/679/oj
- Tietosuojavaltuutettu: https://tietosuoja.fi/
- Supabase DPA: https://supabase.com/legal/customer-resources/data-processing-addendum
- Supabase data residency FAQ: https://supabase.com/legal/privacy-resources/data-residency-and-transfers-faq
