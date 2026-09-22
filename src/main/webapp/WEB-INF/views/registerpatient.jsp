<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Registro de paciente</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
.grid-reg{display:grid;grid-template-columns:2fr 1fr;gap:24px;align-items:start}
@media(max-width:920px){.grid-reg{grid-template-columns:1fr}}
fieldset{border:0;padding:0;margin:24px 0 0}legend{font-family:var(--font-display);font-weight:600;font-size:var(--text-lg)}
.two{display:grid;grid-template-columns:1fr 1fr;gap:12px}@media(max-width:640px){.two{grid-template-columns:1fr}}
.aside{position:sticky;top:88px}.aside ol{margin:12px 0 0;padding-left:20px;color:var(--muted);font-size:15px}
</style>
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<main id="content"><div class="wrap-wide">
<p class="crumbs"><a href="/webmedical/">Inicio</a> / Registro</p>
<p class="eyebrow">Registro · POST /registration</p>
<h1 style="font-size:var(--text-2xl)" data-od-id="titulo-registro">Registro de paciente</h1>
<p style="color:var(--muted)">Tres bloques cortos. El género, la fecha y el teléfono ya usan el control correcto.</p>
<div class="grid-reg" style="margin-top:24px">
<section class="card" data-od-id="form-registro">
<form:form action="registration" modelAttribute="patient" method="POST" id="f">
<fieldset><legend>Identidad</legend>
<div class="two">
<div class="field"><label for="n1">Nombre</label><form:input path="firstName" id="n1" cssClass="input" placeholder="Ej.: María" required="required" /></div>
<div class="field"><label for="n2">Segundo nombre</label><form:input path="secondName" id="n2" cssClass="input" placeholder="Ej.: Elena" required="required" /></div>
</div>
<div class="two">
<div class="field"><label for="a1">Primer apellido</label><form:input path="firstLastName" id="a1" cssClass="input" placeholder="Ej.: García" required="required" /></div>
<div class="field"><label for="a2">Segundo apellido</label><form:input path="secondLastName" id="a2" cssClass="input" placeholder="Ej.: López" required="required" /></div>
</div>
</fieldset>
<fieldset><legend>Datos</legend>
<div class="two">
<div class="field"><label for="ed">Edad</label><form:input path="age" id="ed" cssClass="input" type="number" min="0" max="120" placeholder="Ej.: 34" required="required" /></div>
<div class="field"><label for="ge">Género</label><form:select path="gender" id="ge" cssClass="input"><form:option value="">Selecciona…</form:option><form:option value="F">Mujer</form:option><form:option value="M">Hombre</form:option><form:option value="X">Otra identidad</form:option><form:option value="N">Prefiero no decirlo</form:option></form:select></div>
</div>
<div class="field"><label for="fn">Fecha de nacimiento</label><form:input path="dateOfBirth" id="fn" cssClass="input" type="date" required="required" /></div>
</fieldset>
<fieldset><legend>Contacto</legend>
<div class="field"><label for="di">Dirección</label><form:input path="address" id="di" cssClass="input" placeholder="Ej.: Av. Salud 2354, 2.º B" required="required" /></div>
<div class="field" id="w-tel"><label for="te">Teléfono</label><form:input path="phoneNumber" id="te" cssClass="input" type="tel" placeholder="Ej.: 612 345 678" required="required" /><span class="field-error">Introduce un teléfono válido.</span></div>
</fieldset>
<form:button type="submit" class="btn btn-primary" style="width:100%;margin-top:24px" data-od-id="cta-registrar">Crear ficha de paciente</form:button>
</form:form>
</section>
<aside class="card aside" data-od-id="ayuda-registro">
<h2 style="font-size:var(--text-lg)">Antes de enviar</h2>
<ol><li>Usa tus apellidos legales.</li><li>La fecha define tu edad automáticamente.</li><li>Conservamos tus datos aunque haya un error.</li></ol>
<p style="margin-top:12px;font-size:var(--text-sm);color:var(--muted)">¿Ya estás registrado? <a href="/webmedical/appointments" style="text-decoration:underline">Agenda directamente</a>.</p>
</aside>
</div>
</div></main>
<%@include file="footer.jsp"%>
</div>
<script>
document.getElementById('f').addEventListener('submit',function(e){var t=document.getElementById('te');var digits=t.value.replace(/\D/g,'');var bad=!digits||digits.length<9;t.value=digits;document.getElementById('w-tel').classList.toggle('invalid',bad);if(bad){e.preventDefault();}});
</script>
</body>
</html>
