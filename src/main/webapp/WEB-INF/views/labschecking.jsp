<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Resultado de laboratorio</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
.badge-ok{display:inline-flex;align-items:center;gap:6px;padding:4px 10px;border-radius:var(--radius-pill);font-family:var(--font-mono);font-size:11px;text-transform:uppercase;letter-spacing:.04em;background:color-mix(in oklab,var(--success),transparent 88%);color:var(--success)}
</style>
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<main id="content"><div class="wrap">
<p class="crumbs"><a href="/webmedical/">Inicio</a> / <a href="/webmedical/labs">Laboratorio</a> / Resultado</p>
<c:choose>
<c:when test="${identifier gt 0}">
<section class="card" data-od-id="resultado-lab">
<span class="badge-ok">● Disponible</span>
<h1 style="font-size:var(--text-2xl);margin-top:12px"><c:out value="${labname}"/></h1>
<p style="color:var(--muted)">ID de prueba <span style="font-family:var(--font-mono)"><c:out value="${identifier}"/></span></p>
<dl class="detail">
<dt>Prueba</dt><dd><c:out value="${labname}"/></dd>
<dt>Institución</dt><dd><c:out value="${labintituition}"/></dd>
<dt>Dirección</dt><dd><c:out value="${address}"/></dd>
<dt>Fecha</dt><dd class="mono"><c:out value="${date}"/></dd>
<dt>Hora</dt><dd class="mono"><c:out value="${time}"/></dd>
</dl>
<div class="note">Esta pantalla muestra la cita de la prueba. Los valores clínicos se entregan en PDF firmado. Si necesitas tus imágenes relacionadas, consulta el módulo de imagen.</div>
<div style="display:flex;gap:12px;margin-top:20px;flex-wrap:wrap">
<a class="btn btn-primary" href="/webmedical/imaging" data-od-id="cta-ver-imagen">Ver imágenes relacionadas</a>
<a class="btn btn-secondary" href="/webmedical/labs">Nueva búsqueda</a>
</div>
</section>
</c:when>
<c:otherwise>
<section class="empty">
<h2 style="font-size:var(--text-lg)">Sin resultados para este paciente</h2>
<p style="color:var(--muted);font-size:15px">Verifica tildes y el orden de los apellidos, o comprueba tu registro.</p>
<div style="display:flex;gap:12px;justify-content:center;margin-top:16px;flex-wrap:wrap">
<a class="btn btn-secondary" href="/webmedical/labs">Reintentar búsqueda</a>
<a class="btn btn-secondary" href="/webmedical/register-patient">Verificar registro</a>
</div>
</section>
</c:otherwise>
</c:choose>
</div></main>
<%@include file="footer.jsp"%>
</div>
</body>
</html>
