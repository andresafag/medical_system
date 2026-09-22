<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Laboratorio</title>
<link href="resources/css/style.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<main id="content"><div class="wrap-mid">
<p class="crumbs"><a href="/webmedical/">Inicio</a> / Laboratorio</p>
<section class="card" data-od-id="busqueda-laboratorio">
<div style="display:flex;gap:16px;align-items:flex-start"><div class="icon-pill" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M9 3h6M10 3v6l-5 9a2 2 0 0 0 1.8 3h10.4A2 2 0 0 0 19 18l-5-9V3"/></svg></div>
<div><p class="eyebrow">Laboratorio · POST /checklabs</p>
<h1 style="font-size:var(--text-2xl)">Resultados de laboratorio</h1>
<p style="color:var(--muted)">Busca con tu nombre y dos apellidos, tal como aparecen en tu registro.</p></div></div>
<form:form action="checklabs" modelAttribute="patient" id="f">
<div class="field" id="w1"><label for="n">Nombre</label><form:input path="firstName" id="n" cssClass="input" placeholder="Ej.: María" required="required" /><span class="field-error">Este campo no debe incluir números.</span></div>
<div class="field" id="w2"><label for="a1">Primer apellido</label><form:input path="firstLastName" id="a1" cssClass="input" placeholder="Ej.: García" required="required" /><span class="field-error">Este campo no debe incluir números.</span></div>
<div class="field" id="w3"><label for="a2">Segundo apellido</label><form:input path="secondLastName" id="a2" cssClass="input" placeholder="Ej.: López" required="required" /><span class="field-error">Este campo no debe incluir números.</span></div>
<button class="btn btn-primary" style="width:100%;margin-top:20px" type="submit" data-od-id="cta-buscar-lab">Buscar resultados</button>
<p class="field-help" style="margin-top:12px">¿Sin resultados? Verifica tildes y el orden de los apellidos.</p>
</form:form>
</section>
</div></main>
<%@include file="footer.jsp"%>
</div>
<script>
function bind(id,wrap){var el=document.getElementById(id);if(!el)return;el.addEventListener('input',function(){document.getElementById(wrap).classList.toggle('invalid',/[0-9]/.test(el.value));});}
bind('n','w1');bind('a1','w2');bind('a2','w3');
document.getElementById('f').addEventListener('submit',function(e){var ok=true;[['n','w1'],['a1','w2'],['a2','w3']].forEach(function(p){var el=document.getElementById(p[0]);var v=el.value.trim();var bad=!v||/[0-9]/.test(v);document.getElementById(p[1]).classList.toggle('invalid',bad);if(bad)ok=false;});if(!ok)e.preventDefault();});
</script>
</body>
</html>
