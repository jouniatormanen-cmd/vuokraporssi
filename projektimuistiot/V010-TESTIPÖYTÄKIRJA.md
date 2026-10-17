# Vuokrapörssi v0.10 – testipöytäkirja

Tila: EI TESTATTU. Tuotannon main-haaraa ei saa muuttaa ilman erillistä hyväksyntää.

| Testi | Hyväksymisehto | Tila |
|---|---|---|
| Rekisteröinti ja kirjautuminen | A voi kirjautua ja ulos | EI TESTATTU |
| Ilmoituksen luonti ja kuva | Julkinen ilmoitus näkyy | EI TESTATTU |
| Omien ilmoitusten muokkaus ja poisto | Muutos näkyy myös toisella laitteella | EI TESTATTU |
| Käyttäjän B suora UPDATE A:n ilmoitukseen | Palvelin estää | EI TESTATTU |
| Käyttäjän B suora DELETE A:n ilmoitukseen | Palvelin estää | EI TESTATTU |
| Hakuilmoituksen luonti ja poisto | Omistajuus toteutuu palvelimella | EI TESTATTU |
| Kirjautumaton selaus | Vain tarkoitetut tiedot näkyvät | EI TESTATTU |
| Mobiilin haku ja kuvagalleria | Toimii ilman estäviä virheitä | EI TESTATTU |
| Väärä tai suuri kuva | Hylätään hallitusti | EI TESTATTU |
| Verkkokatko ja vanhentunut istunto | Virhe käsitellään selkeästi | EI TESTATTU |
| Palautteen ja väärinkäytösilmoitusten kanava | Viestit saapuvat vastaanottajalle | EI TESTATTU |

Ennen testiryhmää tarkista Supabasen RLS, Storage, käyttöehdot, tietosuojaseloste ja erillinen testiympäristö. Kokeiluryhmän hyväksyntä: EI VIELÄ. Tämä pöytäkirja ei tarkoita, että testit olisi suoritettu.
