<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Detalle de cita</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
.card-head{padding:var(--space-5);border-bottom:1px solid var(--border);display:flex;justify-content:space-between;gap:16px;align-items:flex-start;flex-wrap:wrap}
.actions{display:flex;gap:12px;flex-wrap:wrap;padding:0 var(--space-5) var(--space-5)}
</style>
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<main id="content"><div class="wrap">
<p class="crumbs"><a href="/webmedical/">Inicio</a> / <a href="/webmedical/appointments">Citas</a> / Resultado</p>
<c:choose>
<c:when test="${identifier gt 0}">
<section class="card" data-od-id="detalle-cita" aria-labelledby="t">
<div class="card-head">
<div><p class="status"><span class="dot"></span>Confirmada</p>
<h1 id="t" style="font-size:var(--text-2xl);margin-top:8px">Tu cita: <c:out value="${reason}"/></h1>
<p class="id">ID <span class="mono"><c:out value="${identifier}"/></span></p></div>
<span class="id">Folio clínico</span>
</div>
<dl class="detail">
<dt>Motivo</dt><dd id="reason"><c:out value="${reason}"/></dd>
<dt>Sede</dt><dd id="intituition"><c:out value="${intituition}"/></dd>
<dt>Especialidad</dt><dd id="specialty"><c:out value="${specialty}"/></dd>
<dt>Médico</dt><dd id="doctorsname"><c:out value="${doctorsname}"/></dd>
<dt>Fecha</dt><dd class="mono" id="date"><c:out value="${date}"/></dd>
<dt>Hora</dt><dd class="mono" id="time"><c:out value="${time}"/></dd>
<dt>Dirección</dt><dd id="address"><c:out value="${address}"/></dd>
</dl>
<p id="identifier" hidden><c:out value="${identifier}"/></p>
<div class="actions" data-od-id="acciones-cita">
<a class="btn btn-primary" href="update-appointment?identifier=${identifier}" data-od-id="cta-reprogramar">Reprogramar</a>
<button class="btn btn-danger" id="delBtn" type="button" data-od-id="cta-eliminar">Eliminar</button>
<a class="btn btn-secondary" href="/webmedical/appointments">Volver</a>
</div>
<form:form action="delete-appointment" modelAttribute="appointment" id="deleteForm" cssStyle="display:none">
<input type="hidden" name="_method" value="DELETE">
<form:input path="appointmentIdentification" hidden="true" value="${identifier}" />
</form:form>
</section>
</c:when>
<c:otherwise>
<section class="empty" data-od-id="estado-vacio-demo">
<h2 style="font-size:var(--text-lg)">¿Buscaste otro número sin resultado?</h2>
<p style="color:var(--muted);font-size:15px">No hay cita registrada con ese número. Verifica el identificador o agenda una cita nueva.</p>
<div style="display:flex;gap:12px;justify-content:center;margin-top:16px;flex-wrap:wrap">
<a class="btn btn-secondary" href="/webmedical/appointments">Revisar número</a>
<a class="btn btn-secondary" href="/webmedical/appointments">Agendar nueva</a>
</div>
</section>
</c:otherwise>
</c:choose>
</div></main>
<div class="modal" id="modal" role="dialog" aria-modal="true" aria-labelledby="mt" data-od-id="modal-eliminar">
<div class="dialog">
<h2 id="mt" style="font-size:var(--text-lg)">Eliminar la cita <c:out value="${identifier}"/></h2>
<p style="color:var(--muted);font-size:15px;margin-top:8px">Esta acción libera tu espacio y no se puede deshacer. Te enviaremos confirmación por correo.</p>
<div style="display:flex;gap:12px;margin-top:20px;justify-content:flex-end;flex-wrap:wrap">
<button class="btn btn-secondary" id="cancelBtn" type="button">Conservar cita</button>
<button class="btn btn-danger" id="confirmBtn" type="button">Sí, eliminar</button>
</div>
</div>
</div>
<%@include file="footer.jsp"%>
</div>
<script>
var m=document.getElementById('modal'),d=document.getElementById('delBtn');
if(d){d.addEventListener('click',function(){m.classList.add('open');document.getElementById('cancelBtn').focus();});}
document.getElementById('cancelBtn').addEventListener('click',function(){m.classList.remove('open');});
m.addEventListener('click',function(e){if(e.target===m){m.classList.remove('open');}});
document.getElementById('confirmBtn').addEventListener('click',function(){document.getElementById('deleteForm').submit();});
document.addEventListener('keydown',function(e){if(e.key==='Escape'){m.classList.remove('open');}});
</script>
</body>
</html>
