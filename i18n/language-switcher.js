(function(){
const phrases=window.VP_PHRASES||{};
const langs=['fi','sv','en'];
let lang='fi';
try{const saved=localStorage.getItem('vp-language');if(langs.includes(saved))lang=saved}catch(e){}

// Translate known application alerts while retaining original error details.
// Other alerts, including third-party messages, pass through unchanged.
const alertPrefixes={
 'Hakuilmoitusta ei voitu avata: ':['Could not open rental request: ','Det gick inte att öppna sökannonsen: '],
 'Kirjautuminen onnistui, mutta ilmoituksen julkaisu epäonnistui: ':['Login succeeded, but publishing the listing failed: ','Inloggningen lyckades, men annonsen kunde inte publiceras: '],
 ' Luonnos säilyy selaimessa.':[' The draft remains in your browser.',' Utkastet finns kvar i webbläsaren.'],
 'Kirjautumisen viimeistely epäonnistui: ':['Could not complete login: ','Det gick inte att slutföra inloggningen: '],
 'Sähköpostilinkki ei toiminut: ':['The email link did not work: ','E-postlänken fungerade inte: '],
 'Poisto epäonnistui: ':['Deletion failed: ','Raderingen misslyckades: ']
};
const nativeAlert=window.alert.bind(window);
window.alert=function(message){
 if(typeof message!=='string'||lang==='fi')return nativeAlert(message);
 let translated=phrases[message]?.[lang==='en'?0:1]||message;
 for(const [source,variants] of Object.entries(alertPrefixes)){
  if(translated.includes(source))translated=translated.split(source).join(variants[lang==='en'?0:1]);
 }
 return nativeAlert(translated);
};

const originalText=new WeakMap(),originalAttributes=new WeakMap();
const reverse={en:new Map(),sv:new Map()};
for(const [fi,pair] of Object.entries(phrases)){if(!Array.isArray(pair))continue;if(!reverse.en.has(pair[0]))reverse.en.set(pair[0],fi);if(!reverse.sv.has(pair[1]))reverse.sv.set(pair[1],fi)}
function sourceText(value,previous){if(previous&&(value===previous||phrases[previous]?.includes(value)))return previous;if(phrases[value])return value;return reverse.en.get(value)||reverse.sv.get(value)||value;}
let processing=false, observer=null;
const watchOptions={childList:true,characterData:true,subtree:true};
function translate(){
 if(processing||!document.body)return;processing=true;
 if(observer)observer.disconnect();
 document.documentElement.lang=lang;
 document.title=lang==='fi'?'Vuokrapörssi – Älä osta. Vuokraa.':lang==='en'?"Vuokrapörssi – Don't buy. Rent.":'Vuokrapörssi – Köp inte. Hyr.';
 // Keep stable Finnish values for options whose value is derived from their label.
 document.querySelectorAll('select option:not([value])').forEach(option=>{
  if(!option.dataset.vpOriginalValue)option.dataset.vpOriginalValue=option.textContent.trim();
  option.value=option.dataset.vpOriginalValue;
 });
 const walker=document.createTreeWalker(document.body,NodeFilter.SHOW_TEXT);
 while(walker.nextNode()){
  const node=walker.currentNode, parent=node.parentElement;
  if(!parent||parent.closest('script,style,svg,textarea,[contenteditable="true"]'))continue;
  const current=node.nodeValue,clean=current.trim();
  if(!clean)continue;
  const previous=originalText.get(node);
  const source=sourceText(clean,previous);
  if(!phrases[source])continue;
  originalText.set(node,source);
  const value=lang==='fi'?source:phrases[source][lang==='en'?0:1];
  if(value!==clean)node.nodeValue=current.replace(clean,value);
 }
 document.querySelectorAll('[placeholder],[aria-label],[title]').forEach(el=>{
  if(el.closest('[contenteditable="true"]'))return;
  for(const attr of ['placeholder','aria-label','title']){
   if(!el.hasAttribute(attr))continue;
   let map=originalAttributes.get(el);if(!map){map={};originalAttributes.set(el,map)}
   const current=el.getAttribute(attr);
   const source=sourceText(current,map[attr]);
   map[attr]=source;
   if(phrases[source])el.setAttribute(attr,lang==='fi'?source:phrases[source][lang==='en'?0:1]);
  }
 });
 document.querySelectorAll('[data-vp-language-select]').forEach(select=>{select.value=lang;});
 processing=false;
 if(observer)observer.observe(document.body,watchOptions);
}
function init(){
 const nav=document.querySelector('header .topnav')||document.querySelector('header');
 if(nav&&!document.getElementById('vp-language')){
  const select=document.createElement('select');
  select.id='vp-language';select.dataset.vpLanguageSelect='true';select.setAttribute('aria-label','Kieli / Language / Språk');
  select.style.cssText='width:auto;min-width:68px;max-width:75px;margin:0 4px;padding:7px;border-radius:9px;font-size:13px;flex-shrink:0';
  select.innerHTML='<option value="fi">FI</option><option value="sv">SV</option><option value="en">EN</option>';
  nav.appendChild(select);
  const mobile=document.getElementById('mobileMenu');
  if(mobile){const mobileSelect=select.cloneNode(true);mobileSelect.id='vp-language-mobile';mobileSelect.style.cssText='display:block;width:100%;max-width:100%;margin:8px 0 14px;padding:12px;font-size:16px';mobile.insertBefore(mobileSelect,mobile.firstChild);}
  document.querySelectorAll('[data-vp-language-select]').forEach(el=>el.addEventListener('change',()=>{lang=el.value;try{localStorage.setItem('vp-language',lang)}catch(e){}translate()}));
 }
 translate();
 observer=new MutationObserver(()=>{if(!processing)translate()});
 observer.observe(document.body,watchOptions);
}
if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);else init();
})();
