<header class="topnav" data-od-id="topnav">
<div class="topnav-inner">
<a class="brand" href="/webmedical/" data-od-id="brand"><span class="brand-mark" aria-hidden="true">+</span><span>Precis Medical</span></a>
<nav class="navlinks" id="nav" aria-label="Principal" data-od-id="nav-principal">
<a href="/webmedical/">Inicio</a>
<a href="/webmedical/appointments">Citas</a>
<a href="/webmedical/labs">Laboratorio</a>
<a href="/webmedical/imaging">Imagen</a>
<a href="/webmedical/benefits">Beneficios</a>
<a href="/webmedical/register-patient" class="btn btn-secondary" style="margin-left:8px">Registrar paciente</a>
</nav>
<button class="menu-btn" id="menuBtn" aria-label="Abrir menú" aria-expanded="false" type="button">☰</button>
</div>
</header>
<script>
(function(){var b=document.getElementById('menuBtn'),n=document.getElementById('nav');if(!b||!n)return;if(b.dataset.bound)return;b.dataset.bound='1';b.addEventListener('click',function(){var o=n.classList.toggle('open');b.setAttribute('aria-expanded',o);});var p=location.pathname;n.querySelectorAll('a[href]').forEach(function(a){var h=a.getAttribute('href');if(h&&h!=='/webmedical/'&&p.indexOf(h)===0){n.querySelectorAll('a').forEach(function(x){x.removeAttribute('aria-current')});a.setAttribute('aria-current','page');}});})();
</script>
