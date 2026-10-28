(function(){
const words={
'← Takaisin Vuokrapörssiin':['← Back to Vuokrapörssi','← Tillbaka till Vuokrapörssi'],
'← Takaisin etusivulle':['← Back to home','← Tillbaka till startsidan'],
'Älä osta. Vuokraa.':["Don't buy. Rent.",'Köp inte. Hyr.'],
'Ohjeet':['Help','Hjälp'],
'Tietoa Vuokrapörssistä':['About Vuokrapörssi','Om Vuokrapörssi'],
'Turvallinen vuokraaminen':['Safe renting','Trygg uthyrning'],
'Käyttöehdot':['Terms of use','Användarvillkor'],
'Tietosuojaseloste':['Privacy notice','Dataskyddsbeskrivning'],
'Ota yhteyttä':['Contact us','Kontakta oss'],
'Sähköposti':['Email','E-post'],
'Yhteys:':['Contact:','Kontakt:'],
'Päivitetty 27.10.2026':['Updated 27 October 2026','Uppdaterad 27 oktober 2026'],
'Onko sinulla kysyttävää Vuokrapörssistä, ilmoituksista tai palvelun käytöstä? Voit ottaa yhteyttä ylläpitoon sähköpostitse.':['Do you have questions about Vuokrapörssi, listings or using the service? Contact our administration by email.','Har du frågor om Vuokrapörssi, annonser eller hur tjänsten används? Kontakta administratören via e-post.'],
'Vuokrapörssi on suomalainen ilmoitusalusta, jossa yksityishenkilöt ja yritykset voivat tarjota vuokrattavia kohteita, palveluja ja elämyksiä sekä jättää hakuilmoituksia. Palvelu yhdistää ilmoittajat ja kiinnostuneet. Vuokrauksesta, maksamisesta ja luovutuksesta sovitaan osapuolten kesken. Palvelua ylläpidetään alkuvaiheessa yksityishenkilönä.':['Vuokrapörssi is a Finnish listings platform where individuals and businesses can offer items, services and experiences for rent or post rental requests. The platform connects advertisers and interested people. The parties agree directly on rentals, payments and handovers. Initially, the service is operated by a private individual.','Vuokrapörssi är en finländsk annonsplattform där privatpersoner och företag kan erbjuda föremål, tjänster och upplevelser för uthyrning eller lägga upp hyresönskemål. Plattformen för samman annonsörer och intresserade. Parterna kommer själva överens om uthyrning, betalning och överlämning. Tjänsten drivs inledningsvis av en privatperson.'],
'Selaa ilmoituksia tai etsi sopivaa kohdetta hakutoiminnolla. Ilmoituksen tekeminen ja omien ilmoitusten hallinta edellyttävät kirjautumista. Kirjautua voi Google-tilillä tai palvelussa käytössä olevalla sähköposti- ja salasanakirjautumisella. Tarkista ilmoituksen tiedot ja sovi vuokrauksen ehdoista suoraan toisen osapuolen kanssa. Ilmoituksen omistaja voi muokata tai poistaa oman ilmoituksensa.':['Browse listings or use search to find a suitable rental. Creating and managing your own listings requires logging in. You can log in with Google or with an email address and password. Check listing details and agree on rental terms directly with the other party. Listing owners can edit or delete their own listings.','Bläddra bland annonser eller använd sökfunktionen för att hitta ett lämpligt objekt. För att skapa och hantera egna annonser behöver du logga in. Du kan logga in med Google eller med e-postadress och lösenord. Kontrollera annonsuppgifterna och kom överens om hyresvillkoren direkt med den andra parten. Annonsägaren kan redigera eller ta bort sina egna annonser.']
};
let lang='fi';try{lang=localStorage.getItem('vp-language')||'fi'}catch(e){}if(!['fi','en','sv'].includes(lang))lang='fi';
const originals=new WeakMap();
function apply(){
 document.documentElement.lang=lang;
 const walker=document.createTreeWalker(document.body,NodeFilter.SHOW_TEXT);
 while(walker.nextNode()){
  const n=walker.currentNode;if(n.parentElement&&n.parentElement.closest('script,style'))continue;
  const current=n.nodeValue.trim(),source=originals.get(n)||current;
  if(!words[source])continue;
  originals.set(n,source);n.nodeValue=n.nodeValue.replace(current,lang==='fi'?source:words[source][lang==='en'?0:1]);
 }
 const sel=document.getElementById('vp-info-language');if(sel)sel.value=lang;
}
function init(){
 const sel=document.createElement('select');sel.id='vp-info-language';sel.setAttribute('aria-label','Kieli / Language / Språk');sel.style.cssText='position:fixed;right:12px;top:12px;z-index:1000;padding:7px;border-radius:8px;background:white;color:#183d31;border:1px solid #aaa;width:auto;font-size:14px';
 sel.innerHTML='<option value="fi">FI</option><option value="en">EN</option><option value="sv">SV</option>';document.body.appendChild(sel);
 sel.addEventListener('change',()=>{lang=sel.value;try{localStorage.setItem('vp-language',lang)}catch(e){}apply()});apply();
}
if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);else init();
})();
