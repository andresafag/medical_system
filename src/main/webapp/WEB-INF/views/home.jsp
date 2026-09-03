<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Inicio</title>
<link href="resources/css/style.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
.hero-grid{display:grid;grid-template-columns:1.4fr 1fr;gap:var(--space-8);align-items:start}
@media(max-width:920px){.hero-grid{grid-template-columns:1fr}}
.id-card{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius-md);padding:var(--space-5)}
.modules{display:grid;grid-template-columns:repeat(2,1fr);gap:var(--space-6);padding:24px 0 56px}
@media(max-width:920px){.modules{grid-template-columns:1fr}}
.feat{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius-md);padding:var(--space-5);display:flex;flex-direction:column;gap:var(--space-3)}
.feat:hover{box-shadow:var(--elev-raised)}
.feat h3{font-size:var(--text-lg)}
.feat p{color:var(--muted);font-size:15px}
.card-link{font-size:var(--text-sm);font-weight:600;margin-top:auto;padding-top:8px}
.card-link:hover{color:var(--accent)}
.strip{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius-md);padding:var(--space-6);display:flex;align-items:center;justify-content:space-between;gap:var(--space-6);flex-wrap:wrap;margin-bottom:56px}
.steps{display:grid;grid-template-columns:repeat(3,1fr);gap:var(--space-6);margin-bottom:56px}
@media(max-width:920px){.steps{grid-template-columns:1fr}}
.step-num{font-family:var(--font-mono);font-size:var(--text-xs);color:var(--muted)}
</style>
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<main id="content">
<section class="hero" data-od-id="hero-inicio">
<div class="container hero-grid">
<div>
<p class="eyebrow">Sistema médico · Citas, laboratorio e imagen</p>
<h1>Gestiona tu atención médica sin llamadas ni filas</h1>
<p class="lead">Consulta tu cita con el identificador, agenda una nueva o revisa tus resultados de laboratorio e imagen con tu nombre y apellidos.</p>
<div style="display:flex;gap:12px;flex-wrap:wrap;margin-top:24px">
<a class="btn btn-primary" href="/webmedical/appointments" data-od-id="cta-agendar">Agendar cita</a>
<a class="btn btn-ghost" href="/webmedical/benefits" data-od-id="cta-beneficios">Ver cómo funciona →</a>
</div>
</div>
<div class="id-card" data-od-id="tarjeta-acceso-rapido">
<h3 style="font-size:var(--text-lg)">¿Tienes tu ID de cita?</h3>
<p class="field-help">Está en tu comprobante. Ejemplo: <span style="font-family:var(--font-mono)">84213</span></p>
<form action="check-appointment" method="POST">
<div class="field"><label for="qid">Identificador de cita</label><input class="input" id="qid" name="appointmentIdentification" inputmode="numeric" pattern="[0-9]+" placeholder="Ej.: 84213" required /></div>
<button class="btn btn-primary" type="submit" style="margin-top:12px;width:100%">Consultar cita</button>
</form>
<p class="field-help" style="margin-top:12px">¿Primera vez? <a href="/webmedical/register-patient" style="text-decoration:underline">Regístrate como paciente</a></p>
</div>
</div>
</section>
<section data-od-id="modulos">
<div class="container">
<div class="modules">
<article class="feat" data-od-id="feature-card-appointments">
<div class="icon-pill" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="3" y="5" width="18" height="16" rx="2"/><path d="M3 10h18M8 3v4M16 3v4"/></svg></div>
<h3>Citas</h3><p>Consulta por identificador o agenda por motivo y especialidad. Reprograma o cancela con confirmación.</p>
<p class="req">Necesitas: ID numérico para consultar</p>
<a class="card-link" href="/webmedical/appointments">Entrar en citas →</a>
</article>
<article class="feat" data-od-id="feature-card-labs">
<div class="icon-pill" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M9 3h6M10 3v6l-5 9a2 2 0 0 0 1.8 3h10.4A2 2 0 0 0 19 18l-5-9V3"/><path d="M7 15h10"/></svg></div>
<h3>Laboratorio</h3><p>Encuentra tu prueba con nombre y apellidos. Consulta sede, fecha y hora de tu análisis.</p>
<p class="req">Necesitas: nombre y dos apellidos</p>
<a class="card-link" href="/webmedical/labs">Entrar en laboratorio →</a>
</article>
<article class="feat" data-od-id="feature-card-imaging">
<div class="icon-pill" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="9" cy="9" r="2"/><path d="M21 15l-5-5-9 9"/></svg></div>
<h3>Imagen diagnóstica</h3><p>Localiza tus radiografías y estudios. Visualízalos en un visor con miniaturas y descarga.</p>
<p class="req">Necesitas: nombre y dos apellidos</p>
<a class="card-link" href="/webmedical/imaging">Entrar en imagen →</a>
</article>
<article class="feat" data-od-id="feature-card-benefits">
<div class="icon-pill" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M12 21s-7-4.5-9-9a5 5 0 0 1 9-3 5 5 0 0 1 9 3c-2 4.5-9 9-9 9z"/></svg></div>
<h3>Beneficios</h3><p>Costes transparentes, acceso a resultados y seguimiento de tu atención en un solo lugar.</p>
<p class="req">Sin requisitos · lectura de 2 min</p>
<a class="card-link" href="/webmedical/benefits">Leer beneficios →</a>
</article>
</div>
<div class="steps" data-od-id="como-funciona">
<div><p class="step-num">Paso 1</p><h3>Regístrate una vez</h3><p style="color:var(--muted);font-size:15px">Completa tus datos de identidad y contacto. Solo toma dos minutos.</p></div>
<div><p class="step-num">Paso 2</p><h3>Agenda o consulta</h3><p style="color:var(--muted);font-size:15px">Usa tu ID para consultar o tus apellidos para laboratorio e imagen.</p></div>
<div><p class="step-num">Paso 3</p><h3>Recibe y gestiona</h3><p style="color:var(--muted);font-size:15px">Reprograma, descarga o revisa tu resultado con total claridad.</p></div>
</div>
<div class="strip" data-od-id="franja-registro">
<div><h3>¿Primera vez en Precis Medical?</h3><p style="color:var(--muted)">Crea tu ficha de paciente para agendar más rápido.</p></div>
<a class="btn btn-secondary" href="/webmedical/register-patient" data-od-id="cta-registro-sec">Registrar paciente</a>
</div>
</div>
</section>
</main>
<%@include file="footer.jsp"%>
</div>
</body>
</html>
