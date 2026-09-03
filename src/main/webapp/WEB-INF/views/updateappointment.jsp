<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Reprogramar cita</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<main id="content"><div class="wrap-mid">
<p class="crumbs"><a href="/webmedical/">Inicio</a> / <a href="/webmedical/appointments">Citas</a> / <a href="/webmedical/appointmentchecking">Detalle</a> / Reprogramar</p>
<section class="card" data-od-id="reprogramar">
<p class="eyebrow">Reprogramar · PATCH /update-appointment</p>
<h1 style="font-size:var(--text-2xl)">Reprograma tu cita</h1>
<p style="color:var(--muted);margin-top:8px">Solo motivo y especialidad son editables en el sistema actual. La fecha y sede se confirman por correo.</p>
<form id="f">
<div class="field"><label for="id">Identificador (solo lectura)</label><input class="input" id="id" name="identifier" value="<c:out value='${identifier}'/>" readonly /></div>
<div class="field"><label for="mo">Motivo</label><select class="input" id="mo" name="reason"><option ${reason == 'Revisión de resultados' ? 'selected' : ''}>Revisión de resultados</option><option ${reason == 'Consulta general' ? 'selected' : ''}>Consulta general</option><option ${reason == 'Control de tratamiento' ? 'selected' : ''}>Control de tratamiento</option><option ${reason == 'Urgencia leve' ? 'selected' : ''}>Urgencia leve</option></select><span class="field-help">Campo aceptado por el endpoint actual.</span></div>
<div class="field"><label for="es">Especialidad</label><select class="input" id="es" name="specialty"><option ${specialty == 'Medicina general' ? 'selected' : ''}>Medicina general</option><option ${specialty == 'Pediatría' ? 'selected' : ''}>Pediatría</option><option ${specialty == 'Cardiología' ? 'selected' : ''}>Cardiología</option><option ${specialty == 'Radiología' ? 'selected' : ''}>Radiología</option></select></div>
<div class="field"><label for="no">Nota para el equipo (opcional)</label><input class="input" id="no" placeholder="Ej.: prefiero turno de mañana" /></div>
<div style="display:flex;gap:12px;margin-top:24px;flex-wrap:wrap">
<button class="btn btn-primary" type="submit" data-od-id="cta-guardar">Guardar cambios</button>
<a class="btn btn-secondary" href="/webmedical/appointmentchecking">Volver al detalle</a>
</div>
<p class="field-help" id="ok" style="display:none;margin-top:12px;color:var(--success)">Cambios guardados. Te redirigimos al detalle…</p>
<p class="field-error" id="fail" style="margin-top:12px">No se pudo guardar. Inténtalo de nuevo.</p>
</form>
</section>
</div></main>
<%@include file="footer.jsp"%>
</div>
<script>
document.getElementById('f').addEventListener('submit',function(e){e.preventDefault();document.getElementById('fail').style.display='none';fetch('update-appointment',{method:'PATCH',body:new URLSearchParams(new FormData(e.target)),headers:{'Content-type':'application/x-www-form-urlencoded'}}).then(function(r){var h='';for(var p of r.headers.entries()){if(p[0]==='custom-header'){h=p[1];}}if(h==='passed'){var o=document.getElementById('ok');o.style.display='block';setTimeout(function(){window.location.href='appointmentchecking';},900);}else{document.getElementById('fail').style.display='block';}}).catch(function(){document.getElementById('fail').style.display='block';});});
</script>
</body>
</html>
