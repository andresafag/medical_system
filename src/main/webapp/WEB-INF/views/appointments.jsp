<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Citas</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
.tabs{display:flex;gap:var(--space-2);margin:24px 0;border-bottom:1px solid var(--border)}
.tab{border:0;background:transparent;padding:12px 16px;font:inherit;font-size:var(--text-sm);font-weight:600;color:var(--muted);border-bottom:2px solid transparent;min-height:44px;cursor:pointer}
.tab[aria-selected="true"]{color:var(--fg);border-bottom-color:var(--accent)}
.grid2{display:grid;grid-template-columns:1fr 1fr;gap:var(--space-6);padding:24px 0 56px;align-items:start}
@media(max-width:920px){.grid2{grid-template-columns:1fr}}
.two{display:grid;grid-template-columns:1fr 1fr;gap:12px}
@media(max-width:640px){.two{grid-template-columns:1fr}}
</style>
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<main id="content"><div class="container">
<section style="padding:48px 0 8px" data-od-id="cabecera-citas">
<p class="crumbs"><a href="/webmedical/">Inicio</a> / Citas</p>
<p class="eyebrow">Citas · Consultar y agendar</p>
<h1 style="font-size:var(--text-2xl);letter-spacing:var(--tracking-display)">Consulta o agenda tu cita</h1>
<p class="lead">Dos tareas separadas: consulta con tu identificador o agenda con tus datos y especialidad.</p>
<div class="tabs" role="tablist" aria-label="Tareas de cita" data-od-id="tabs-citas">
<button class="tab" role="tab" aria-selected="true" id="tab1" aria-controls="panel1" type="button">Consultar cita</button>
<button class="tab" role="tab" aria-selected="false" id="tab2" aria-controls="panel2" type="button">Agendar cita</button>
</div>
</section>
<section data-od-id="paneles-citas"><div class="grid2 appointments-box">
<div class="card check-appointment" id="panel1" role="tabpanel" aria-labelledby="tab1" data-od-id="panel-consultar">
<span class="badge">Recomendado si ya tienes ID</span>
<h2 style="font-size:var(--text-xl);margin-top:12px">Consultar cita</h2>
<p style="color:var(--muted);font-size:15px">Introduce el identificador de tu comprobante.</p>
<form:form action="check-appointment" modelAttribute="appointment" id="formConsultar">
<div class="field" id="f-id"><label for="appointmentIdentification">Identificador de cita</label><form:input path="appointmentIdentification" id="appointmentIdentification" cssClass="input" type="number" placeholder="Ej.: 84213" required="required" /><span class="field-help">Solo números, sin espacios.</span><span class="field-error">Introduce un identificador válido.</span></div>
<button class="btn btn-primary" type="submit" style="width:100%;margin-top:16px" data-od-id="cta-consultar">Consultar cita</button>
</form:form>
<div class="note">¿No encuentras tu ID? Revisa tu correo de confirmación o <a href="/webmedical/register-patient" style="text-decoration:underline">verifica tu registro</a>.</div>
</div>
<div class="card schedule-appointment" id="panel2" role="tabpanel" aria-labelledby="tab2" hidden data-od-id="panel-agendar">
<span class="badge" style="background:transparent;border:1px solid var(--border);color:var(--muted)">Nueva solicitud</span>
<h2 style="font-size:var(--text-xl);margin-top:12px">Agendar cita</h2>
<p style="color:var(--muted);font-size:15px">Completa motivo, identidad y especialidad.</p>
<form:form action="schedule-appointment" modelAttribute="binding" id="formAgendar">
<input type="hidden" name="_method" value="PUT">
<div class="field"><label for="reason">Motivo</label><form:select path="reason" id="reason" cssClass="input"><form:option value="">Selecciona un motivo…</form:option><form:option value="Consulta general">Consulta general</form:option><form:option value="Control de tratamiento">Control de tratamiento</form:option><form:option value="Revisión de resultados">Revisión de resultados</form:option><form:option value="Urgencia leve">Urgencia leve</form:option></form:select></div>
<div class="two">
<div class="field" id="f-n"><label for="nom">Nombre</label><form:input path="firstName" id="nom" cssClass="input" placeholder="Ej.: María" required="required" /><span class="field-error">Sin números.</span></div>
<div class="field" id="f-a1"><label for="ape1">Primer apellido</label><form:input path="lastName" id="ape1" cssClass="input" placeholder="Ej.: García" required="required" /><span class="field-error">Sin números.</span></div>
</div>
<div class="field" id="f-a2"><label for="ape2">Segundo apellido</label><form:input path="secondLastName" id="ape2" cssClass="input" placeholder="Ej.: López" required="required" /><span class="field-error">Sin números.</span></div>
<div class="field"><label for="esp">Especialidad</label><form:select path="specialty" id="esp" cssClass="input"><form:option value="">Selecciona…</form:option><form:option value="Medicina general">Medicina general</form:option><form:option value="Pediatría">Pediatría</form:option><form:option value="Cardiología">Cardiología</form:option><form:option value="Radiología">Radiología</form:option><form:option value="Laboratorio">Laboratorio</form:option></form:select></div>
<form:button type="submit" class="btn btn-secondary" style="width:100%;margin-top:16px" data-od-id="cta-agendar-enviar">Solicitar cita</form:button>
<p class="field-help" style="margin-top:8px">Al enviar aceptas ser contactado para confirmar fecha y sede.</p>
</form:form>
</div>
</div></section>
</div></main>
<%@include file="footer.jsp"%>
</div>
<script>
var t1=document.getElementById('tab1'),t2=document.getElementById('tab2'),p1=document.getElementById('panel1'),p2=document.getElementById('panel2');
function sel(t){var c=t===t1;t1.setAttribute('aria-selected',c);t2.setAttribute('aria-selected',!c);p1.hidden=!c;p2.hidden=c;}
t1.addEventListener('click',function(){sel(t1)});t2.addEventListener('click',function(){sel(t2)});
document.getElementById('formConsultar').addEventListener('submit',function(e){var v=document.getElementById('appointmentIdentification').value.trim();var f=document.getElementById('f-id');var ok=/^[0-9]+$/.test(v);f.classList.toggle('invalid',!ok);if(!ok){e.preventDefault();}});
function noNum(id,fid){var el=document.getElementById(id);if(!el)return;el.addEventListener('input',function(){var bad=/[0-9]/.test(el.value);document.getElementById(fid).classList.toggle('invalid',bad);});}
noNum('nom','f-n');noNum('ape1','f-a1');noNum('ape2','f-a2');
</script>
<script type="text/javascript" src="resources/js/appointments.js"></script>
</body>
</html>
