(function(){
 const translations=window.VP_TRANSLATIONS;
 if(!translations)return;
 const keys={navBrowse:'browse',navWanted:'wanted',navCreate:'create',accountNav:'account',logoutNav:'logout'};
 const initial=localStorage.getItem('vp-language')||'fi';
 function apply(lang){
  if(!translations[lang])lang='fi';
  document.documentElement.lang=lang;
  for(const [id,key] of Object.entries(keys)){
   const element=document.getElementById(id);
   if(element)element.textContent=translations[lang][key];
  }
  const selector=document.getElementById('vp-language');
  if(selector)selector.value=lang;
  localStorage.setItem('vp-language',lang);
 }
 function init(){
  const nav=document.querySelector('header .topnav');
  if(!nav)return;
  const select=document.createElement('select');
  select.id='vp-language';
  select.setAttribute('aria-label','Kieli / Language / Språk');
  select.style.cssText='width:auto;min-width:74px;margin:0 4px;padding:7px;border-radius:9px;font-size:13px';
  select.innerHTML='<option value="fi">FI</option><option value="en">EN</option><option value="sv">SV</option>';
  nav.appendChild(select);
  select.addEventListener('change',()=>apply(select.value));
  apply(initial);
 }
 if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);else init();
})();
