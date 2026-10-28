(function(){
const phrases=window.VP_PHRASES||{};
const langs=['fi','en','sv'];
let lang='fi';
try{const saved=localStorage.getItem('vp-language');if(langs.includes(saved))lang=saved}catch(e){}
const originalText=new WeakMap(),originalAttributes=new WeakMap();
let processing=false, observer=null;
const watchOptions={childList:true,characterData:true,subtree:true};
function translate(){
 if(processing||!document.body)return;processing=true;
 if(observer)observer.disconnect();
 document.documentElement.lang=lang;
 document.title=lang==='fi'?'Vuokrapörssi – Älä osta. Vuokraa.':lang==='en'?"Vuokrapörssi – Don't buy. Rent.":'Vuokrapörssi – Köp inte. Hyr.';
 const walker=document.createTreeWalker(document.body,NodeFilter.SHOW_TEXT);
 while(walker.nextNode()){
  const node=walker.currentNode, parent=node.parentElement;
  if(!parent||parent.closest('script,style,svg,textarea,[contenteditable="true"]'))continue;
  const current=node.nodeValue,clean=current.trim();
  if(!clean)continue;
  let source=originalText.get(node)||clean;
  if(source!==clean && phrases[clean])source=clean;
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
   if(!map[attr])map[attr]=current;
   const source=map[attr];
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
  select.innerHTML='<option value="fi">FI</option><option value="en">EN</option><option value="sv">SV</option>';
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
