# Vuokrapörssi v0.10 – kokeiluryhmän testiversio

Tavoite: valmistella rajatulle kokeiluryhmälle tarkoitettu versio maanantaiksi 19.10.2026. Nykyinen toimiva v0.9 pidetään palautettavana varaversiona.

## Hyväksymiskriteerit
- Mobiilikäyttö, navigointi, ilmoitushaku ja ilmoitusten katselu toimivat.
- Google- ja sähköpostikirjautuminen sekä uloskirjautuminen testataan.
- Käyttäjä voi julkaista, muokata ja poistaa omia ilmoituksiaan sekä kuvia.
- Sähköpostiyhteydenotto avautuu mobiilissa; viestin perillemeno testataan erikseen.
- Toisen käyttäjän tietoja ei voi muokata tai poistaa. Tämä edellyttää Supabasen RLS- ja Storage-oikeuksien todentamista.
- Ylläpitäjän oikeudet tarkistetaan palvelinpuolelta; selainkoodin sähköpostivertailu ei riitä.
- Käyttöehdot, tietosuojaseloste ja yhteystietojen julkisuutta koskeva ilmoitus ovat riittävät rajattuun testiin ja soveltuviin velvoitteisiin.
- Testiryhmälle on palaute- ja väärinkäytösilmoituskanava.

## Eteneminen
1. Tarkista lähdekoodi ja valmistele korjaukset erillään tuotannosta.
2. Varmista palvelinpuolen käyttöoikeudet ennen ulkopuolisia testitunnuksia.
3. Tee puhelimella helppo läpikäynti yhdellä testikäyttäjällä.
4. Kutsu rajattu kokeiluryhmä vasta kriittisten tarkistusten jälkeen.

## Rajaukset
Tämä on suunnitelma, ei väite siitä että v0.10 olisi valmis tai että palvelinpuolen tietoturva olisi hyväksytty. Tuotannon index.html ei muutu tätä muistiota tallennettaessa.
