# Vuokrapörssi v0.10 – kehitystilanne ja julkaisuportti

Pohjana julkaistu ja puhelimella hyväksytty v0.9. v0.10 on erillisessä kehityshaarassa, ei julkaistu.

## Toteutetut muutokset
- Poistettu selaimen sähköpostivertailuun perustuva ylläpitäjän poistopainike ja sen kutsuma toiminto. Tavallisen käyttäjän omien ilmoitusten poisto säilyy.
- Koodattu sähköpostiosoite mailto-linkissä ja suojattu ilmoitussivun saatavuusteksti.
- Lisätty ilmoituskuvien osoitteiden tarkistus (HTTPS ja tietyt base64-kuvamuodot) ilmoituskortteihin, kuvagalleriaan ja latauksen esikatseluun.
- Poistettu harhaanjohtava "Vapaa tänään" -merkintä, jos ilmoituksessa ei ole lainkaan saatavuuspäivämääriä.

## Varmistettava ennen kokeiluryhmän kutsumista
1. Tietokannan rivikohtainen käyttöoikeus (RLS): vain omistaja saa muokata tai poistaa ilmoituksensa. Pelkkä selainrajaus ei riitä.
2. Supabase Storage -käyttöoikeudet ja tiedostojen koko- ja tyyppirajat.
3. Käyttöehdot ja tietosuojaseloste, rekisterinpitäjän tiedot sekä ilmoitusten yhteystietojen julkisuudesta kertominen.
4. Rekisteröitymisen, ilmoituksen luomisen, muokkauksen, poiston, hakuilmoitusten ja kuvien käytännön testit v0.10-versiossa.
5. Väärinkäytöksistä ilmoittamisen ja palautteen vastaanottamisen toimivuus.

## Testauksen tila
Lähdekoodia on tarkastettu ja kehityshaaraan tallennettu korjauksia. Automaattista selainkoetta, tietokannan suoraa käyttöoikeustestiä tai Supabase-politiikkojen tarkistusta ei ole tehty. Näin ollen v0.10 ei ole vielä hyväksytty ulkopuoliseen testiin.

## Tuotannon suojaus
Tuotannon index.html pysyy v0.9-versiona. Älä yhdistä kehityshaaraa main-haaraan ennen testejä ja käyttäjän erillistä julkaisuhyväksyntää.
