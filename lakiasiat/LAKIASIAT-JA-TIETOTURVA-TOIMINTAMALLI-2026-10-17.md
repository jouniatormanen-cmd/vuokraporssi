# Vuokrapörssi – lakiasioiden ja tietoturvan viimeistelyn toimintamalli
Päivitetty 17.10.2026. Sisäinen työohje; ei korvaa julkaistavia käyttöehtoja eikä tietosuojaselostetta.

## Sovitut lähtökohdat
- Ylläpitäjä aloittaa yksityishenkilönä.
- Vuokrapörssi on ilmoitusalusta; vuokra- ja palvelusopimukset sekä maksut tehdään käyttäjien kesken.
- Ilmoittajina voi olla yksityisiä ja yrityksiä.
- Ylläpitäjän henkilöllisyyttä tai osoitetta ei täytetä arvauksilla.
- Julkiseen käyttöön siirtyminen edellyttää jäljempänä kuvattujen avointen asioiden ratkaisua.

## Julkaisua varten valmisteltavat yhteyskanavat
1. Julkinen yhteyssähköposti on päätetty: **vuokraporssi@protonmail.com**. Palveluntarjoajan muut tunnistetiedot vahvistetaan erikseen.
2. Tietosuojaoikeuksien yhteydenottokanava: **vuokraporssi@protonmail.com** (viestin aihe: Tietosuojapyyntö).
3. Laittoman sisällön ilmoituskanava: **vuokraporssi@protonmail.com** (viestin aihe: Ilmoitus sisällöstä). Käsittelyssä kirjataan ilmoituksen vastaanotto, arviointi, ratkaisu ja mahdollinen perustelu sekä lain vaatimat muutoksenhakutiedot.
4. Turvallisuuspoikkeamista ilmoittamisen kanava. Samaa sähköpostia voi käyttää useampaan tarkoitukseen, jos viestit pystytään käsittelemään asianmukaisesti.

## Ilmoituksen julkaisu: käyttöliittymään toteutettava
- Selkeä tieto, mitkä yhteystiedot näkyvät julkisesti myös kirjautumattomille.
- Valinta: ilmoittaja on yksityishenkilö tai elinkeinonharjoittaja. Tarvittavat yritystiedot kerätään ja näytetään lain vaatimalla tavalla.
- Käyttöehtojen linkki ja selkeä hyväksyntä ennen ensimmäistä ilmoituksen julkaisemista/tilin luomista soveltuvalla tavalla.
- Tietosuojaseloste helposti löydettävänä; tietosuojaselosteen lukemista ei saa sekoittaa yleiseksi GDPR-suostumukseksi.
- Mahdollisuus ilmoittaa epäillystä laittomasta sisällöstä.
- Todellisten hakujärjestysperusteiden kuvaus.

## Tietojen elinkaari – vahvistettava ennen lupausten antamista
- Aktiiviset ilmoitukset ja hakuilmoitukset: säilyvätkö tilin voimassaolon ajan, vanhenevatko automaattisesti?
- Käyttäjän poistama ilmoitus: poistetaanko tietue fyysisesti vai piilotetaanko se, ja poistuvatko kuvat Storage-bucketista?
- Tilin poistopyyntö: miten henkilöllisyys varmistetaan, miten Auth-käyttäjä, ilmoitukset, kuvat ja lokit käsitellään?
- Varmuuskopioiden ja teknisten lokien säilytysajat: vahvistetaan käytössä olevilta palveluntarjoajilta.
- Rekisteröidyn pyyntöjen käsittely: vastaanotto, henkilöllisyyden tarkistus tarpeen mukaan, määräajat ja vastaus.
Älä julkaise tarkkoja säilytysaikoja ennen kuin ne vastaavat toteutusta.

## Tietoturvan hyväksymistestit (vielä avoimet)
- Anonyymi: suorat REST-kyselyt eivät paljasta owner_id:tä; julkinen näkymä palauttaa vain tarkoitukselliset kentät.
- Käyttäjä A ja B: kumpikaan ei voi muokata tai poistaa toisen ilmoitusta eikä lukea yksityisiä kenttiä.
- Storage: vain omaan kansioon saa ladata tai poistaa kuvia; tiedostokoko- ja tiedostotyyppirajat toimivat; poistaminen ei jätä tarpeettomia kuvia.
- Auth: sähköposti/salasana, vahvistus ja salasanan palautus testataan; Google-kirjautuminen ja uloskirjautuminen on jo testattu.
- Selainturva: kaikki HTML:ään sijoitetut käyttäjäkentät ja URL:t tarkistetaan; ulkoiset skriptit ja selaintallennus inventoidaan.
- Käyttöehdot/tietosuoja: julkiset linkit, ajantasaiset tekstit ja ilmoitusten julkisuusilmoitukset.

## Toimintamalli väärinkäytösilmoituksille
1. Kirjaa vastaanottoaika, ilmoitettu URL/ilmoitus-ID ja väitetty ongelma.
2. Arvioi, onko sisältö lainvastainen tai ehtojen vastainen; säilytä vain tarpeelliset tiedot.
3. Toteuta suhteellinen toimenpide ja dokumentoi perustelu.
4. Ilmoita asianomaisille soveltuvan lain edellyttämällä tavalla; tarjoa soveltuva valitus-/oikaisumenettely.
5. Jos kyse on henkilötietojen tietoturvaloukkauksesta, arvioi ilmoitusvelvollisuus valvontaviranomaiselle ja rekisteröidyille sekä määräajat (GDPR 33–34 artikla).

## Käyttäjän vahvistamat toimintatestit
17.10.2026: etusivu, kuvitus, ilmoituksen avaus, haku, kategoriat, Google-kirjautuminen, omat ilmoitukset, muokkausnäkymä, hakuilmoitukset, tallennus, kuvien lataus ja uloskirjautuminen toimivat käyttäjän testissä. Ei sama asia kuin tekninen tietoturva-auditointi.

## Lähdeasiakirjat
- KAYTTOEHDOT-LUONNOS-v01.md
- TIETOSUOJASELOSTE-LUONNOS-v01.md
- TIETOTURVA-JA-JULKAISUTARKISTUS-v08.md

**Seuraava julkaisua estävä päätös:** ylläpitäjän julkiset yhteystiedot ja ilmoituskanava. Muita henkilötietoja ei pyydetä ennen kuin ne ovat tarpeen.
