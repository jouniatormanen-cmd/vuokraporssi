# Vuokrapörssi v0.8 – ulkopuolisen testauksen tarkistuslista

Tila 17.10.2026: erillinen julkaisukatselmuksen testisivu valmis lähdekooditasolla. Ei vielä hyväksytty tuotantoon.

## Tehty
- Hakuilmoitusten Supabase-taulu ja RLS-säännöt otettu käyttöön käyttäjän vahvistuksen mukaan.
- Hakuilmoituksen julkaisu, julkinen selaus ja omistajan poisto testattu käyttäjän toimesta.
- Hakuilmoituksen julkisen sähköpostiosoitteen huomautus ja pakollinen hyväksyntä lisätty.
- Näkymien päällekkäisyys korjattu Oma Vuokrapörssi -siirtymässä.
- Ylävalikon asettelua parannettu kapeilla ja keskikokoisilla näytöillä.
- Vuoden 2027 tiedote lisätty erilliseen testiversioon.

## Ennen ulkopuolisten testaajien kutsumista
1. Testaa kirjautuminen ja uloskirjautuminen Googlella sekä sähköpostilla.
2. Testaa eri käyttäjillä: A luo hakuilmoituksen; B näkee sen mutta ei voi poistaa sitä; A voi poistaa.
3. Testaa myös RLS suoraan tietokantakutsulla: toisen käyttäjän poisto ei onnistu, vaikka kutsu muokataan selaimessa.
4. Testaa uusi vuokrausilmoitus, muokkaus, poisto, kuvien lisäys ja saatavuuskalenteri.
5. Testaa puhelimella ja tietokoneella, etenkin navigaatio, lomakkeet ja tiedotteen avaus.
6. Lisää oikeasti avautuvat käyttöehdot, tietosuojaseloste, turvallisuusohjeet ja yhteystiedot. Nykyisessä alatunnisteessa ne ovat vain tekstipaikkoja.
7. Päätä yhteyssähköpostin julkisen näyttämisen tietosuojakäytännöstä. Nykyinen Supabase-taulu antaa julkisen SELECT-oikeuden contact_email-kenttään.
8. Testaa virhetilanteet: verkkokatko, väärä salasana, tyhjä kenttä, liian lyhyt kuvaus.
9. Tarkista mobiilinavigaatio aidossa selaimessa. Kooditarkastus ei korvaa visuaalista testausta.
10. Ota varmuuskopio tuotantokoodista ja tietokannasta ennen mahdollista julkaisua.

## Rajaus
Älä korvaa tuotannon index.html-tiedostoa ilman käyttäjän erillistä hyväksyntää.
