# Vuokrapörssi v0.10 – kokeiluryhmän hyväksymistesti

Tarkoitus: rajattu kokeiluryhmä, ei vielä avoin yleisöjulkaisu.

## Käytännön testit kahdella eri käyttäjällä
1. Käyttäjä A rekisteröityy, vahvistaa sähköpostin, kirjautuu sisään ja ulos.
2. Käyttäjä A luo ilmoituksen, lisää kuvan ja tarkistaa julkisen ilmoitussivun.
3. Käyttäjä A muokkaa otsikkoa, saatavuutta ja kuvaa; päivityksen tulee näkyä myös toisella laitteella.
4. Käyttäjä B kirjautuu omalle tililleen. B ei saa muokata eikä poistaa A:n ilmoitusta, myöskään suoraan tietokantarajapinnan kautta.
5. Käyttäjä A poistaa ilmoituksensa. Se katoaa hausta ja omista ilmoituksista.
6. Kirjautumaton käyttäjä selaa ilmoituksia ja avaa sähköpostiyhteydenoton.
7. Hakuilmoitusten lisääminen ja omistajan poisto testataan.
8. Mobiilin etusivu, valikot, haku, lomakkeet ja kuvagalleria testataan.
9. Virhetilanteet: yhteyskatko, väärä kuvatiedosto, liian suuri kuva, vanhentunut kirjautuminen.

## Pakollinen tietoturvavarmistus ennen kutsuja
- Supabase listings-taulun SELECT/INSERT/UPDATE/DELETE RLS-politiikat ja oikeudet.
- Supabase wanted_listings-taulun omistajarajaukset.
- Storage listing-images: lataus, luku ja poisto vain sovittujen sääntöjen mukaan.
- Tietosuojaseloste ja käyttöehdot soveltuvat testiin; yhteystietojen näkyvyys kerrotaan ilmoittajalle.
- Testikäyttäjien palautteen ja väärinkäytösilmoitusten vastaanotto toimii.

## Julkaisupäätös
Tila: EI VIELÄ HYVÄKSYTTY. Koodimuutokset on tallennettu erilliseen haaraan, mutta Supabasen RLS-politiikkoja ja kahden käyttäjän oikeustestiä ei ole varmennettu. Älä kutsu ulkopuolisia testaajia tai yhdistä haaraa tuotantoon ennen näitä tarkistuksia ja julkaisuhyväksyntää.
