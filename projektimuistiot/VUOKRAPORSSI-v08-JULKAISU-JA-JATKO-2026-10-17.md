# Vuokrapörssi v0.8 – julkaisu ja jatko 17.10.2026

## Julkaisutilanne
- Repo: jouniatormanen-cmd/vuokraporssi, branch main.
- Tuotanto: https://jouniatormanen-cmd.github.io/vuokraporssi/ (index.html).
- Käyttäjä hyväksyi esikatselun vuokraporssi-v08-kaikki-alalinkit-esikatselu-2026-10-17.html ja antoi luvan varmuuskopiointiin sekä julkaisuun.
- Ennen julkaisua otettu ja SHA-tarkistettu varmuuskopio: varmuuskopiot/index-v08-ennen-alalinkkien-julkaisua-2026-10-17.html.
- Varmuuskopion Git-blob SHA: 799eddff7024b76dbcd25109b4aefede5c1ac9db; varmuuskopiocommit d66a764bdd5d954f6a6e620e36b75d56f4649f1b.
- Tuotantoon julkaistu hyväksytty testiversio: commit eba380589ad3e90bab233fbba464231c66fe1842.
- Tuotannon index.html:n Git-blob SHA tarkistettu julkaisun jälkeen: 8be28ea8eac4bf7116f23c7027740201ad4e0dcf, sama kuin hyväksytyn esikatselun SHA.
- Julkisen GitHub Pages -osoitteen valmistumista tai näkymistä käyttäjän selaimessa ei ole vielä tämän merkinnän yhteydessä vahvistettu.

## Toiminnallisuus
Käyttäjä testasi ja vahvisti toimiviksi: etusivu ja kuvitus, ilmoitusten avaus, haku ja kategoriat, Google-kirjautuminen, omat ilmoitukset, ilmoituksen muokkaus, hakuilmoitukset, tallennuksen pysyvyys, kuvien lataus ja uloskirjautuminen.
Alatunnisteen kuusi linkkiä testattu käyttäjän toimesta esikatselussa toimiviksi: Tietoa Vuokrapörssistä, Ohjeet, Turvallinen vuokraaminen, Käyttöehdot, Tietosuoja, Ota yhteyttä. Sivut ovat info/-hakemistossa. Käyttöehdot ja tietosuoja ovat nimenomaisesti keskeneräisiä info-sivuja, eivät lopulliset asiakirjat.

## Yhteystiedot ja juridiset asiakirjat
- Ylläpito aloitetaan yksityishenkilönä.
- Käyttäjän valitsema sähköposti: vuokraporssi@protonmail.com.
- Sähköposti lisätty lakiasiat/KAYTTOEHDOT-LUONNOS-v01.md, lakiasiat/TIETOSUOJASELOSTE-LUONNOS-v01.md ja lakiasiat/LAKIASIAT-JA-TIETOTURVA-TOIMINTAMALLI-2026-10-17.md.
- Julkinen yhteydenottolinkki on mailto:vuokraporssi@protonmail.com.
- Lakiasiakirjoissa on edelleen vahvistettavia kohtia: rekisterinpitäjän tunniste- ja muut yhteystiedot, säilytysajat, tilin ja kuvien poisto, ilmoittajan yritys/yksityinen-valinta, DSA-menettelyt, eväste- ja rajapintatarkistukset.

## Tietoturva
- Supabasen anon owner_id -sarakeoikeuksien SQL-korjaus tehty käyttäjän toimesta; information_schema-jälkitarkistus ei näyttänyt anon owner_id SELECT -oikeuksia.
- Varsinaiset suorat REST-/RLS-/Storage-roolitestit ja XSS-auditointi vielä avoinna.
- lakiasiat/TIETOTURVA-JA-JULKAISUTARKISTUS-v08.md päivitetty vastaamaan korjausta ja toimintatestejä.
- Älä julista julkaisua lakien tai tietoturvan osalta täysin valmiiksi.

## Seuraava työ
1. Tarkista käyttäjän selaimessa uusi tuotanto ja alatunnisteen linkit.
2. Viimeistele mobiilinäkymä erilliseen testiversioon. Älä muuta tuotantoa ilman uutta lupaa.
3. Viimeistele juridiset tekstit ja niiden edellyttämät toiminnot sekä tietoturvan avoimet testit ennen laajaa julkista käyttöönottoa.
