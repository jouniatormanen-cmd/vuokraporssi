# Vuokrapörssi – julkaisuvalmistelun tilanne 17.10.2026

## Vahvistetut päätökset
- Vuokrapörssi aloitetaan **yksityishenkilön ylläpitämänä** vuokrausilmoituspalveluna. Yrityksen perustamista ei edellytetä tässä kehitysvaiheessa.
- Palvelu on tarkoitettu yksityishenkilöiden ja yritysten ilmoituksille koko Suomessa.
- Tekninen toteutus: GitHub Pages ja Supabase; Google- sekä sähköposti/salasana-kirjautuminen.
- Toimivaa tuotannon `index.html`-tiedostoa **ei korvata ilman erillistä hyväksyntää**.
- Viimeisin hyväksytty ulkoasutesti: `vuokraporssi-v08-ilmoituksen-tekstit-valkoisiksi-testi.html`.

## Supabase-korjauksen tilanne käyttäjän testitulosten perusteella
- Käyttäjä tallensi `listings`- ja `wanted_listings`-taulujen tulokset CSV-tiedostoiksi ja tarkisti molemmat LibreOfficessa. Kyse on vientikopioista, ei koko tietokannan varmuuskopiosta.
- Käyttäjä ajoi anonyymin käyttäjän SELECT-oikeuksia rajaavan SQL-muutoksen. Supabase ilmoitti `Success. No rows returned`.
- Käyttäjä ajoi sen jälkeen `information_schema.column_privileges`-tarkistuksen sarakkeelle `owner_id`, tauluille `listings` ja `wanted_listings`, roolille `anon`; tulos oli `Success. No rows returned`.
- Tämän perusteella aiemmin havaittu anonyymin `owner_id`-sarakkeen SELECT-oikeus on korjattu. **Selaimen ja REST-rajapinnan toimivuus ja muut RLS/Storage-oikeudet on vielä testattava**.

## Käyttöehdot ja tietosuoja
- Nykyiset laajat työluonnokset: `lakiasiat/KAYTTOEHDOT-LUONNOS-v01.md` ja `lakiasiat/TIETOSUOJASELOSTE-LUONNOS-v01.md`.
- Palveluntarjoaja/rekisterinpitäjä kuvataan aluksi yksityishenkilönä, ei yrityksenä.
- Ennen julkaisua on vahvistettava julkiset yhteystiedot, ilmoituskanava, säilytys- ja poistokäytännöt, palveluntarjoajan tunnistetiedot sekä soveltuvat velvoitteet.
- Käyttäjän yhteystietoja tai henkilötietoja ei lisätä julkisiin asiakirjoihin arvaamalla.

## Jäljellä ennen julkaisua
1. Testaa anonyymin selaajan vuokraus- ja hakuilmoitusten selaus uuden SQL-korjauksen jälkeen.
2. Testaa kirjautuminen, omien ilmoitusten luonti, muokkaus ja poisto sekä toisen käyttäjän tietojen suoja.
3. Tarkista kuvatallennuksen käyttöoikeudet, lomakesyötteiden turvallisuus ja mahdollinen viestitoiminto.
4. Viimeistele käyttöehdot ja tietosuojaseloste vahvistetuilla ylläpitäjätiedoilla sekä toteuta linkit ja hyväksyntä sivustolle.
5. Testaa mobiiliversio vasta edellisten vaiheiden jälkeen.
6. Vie testattu versio tuotantoon vain käyttäjän erillisellä hyväksynnällä.

**Tila:** kehitysvaihe, ei vielä julkaisuhyväksyntää.
