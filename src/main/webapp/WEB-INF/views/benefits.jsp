<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Beneficios</title>
<link href="resources/css/style.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
.hero-b{text-align:center;padding:72px 0 32px;max-width:720px;margin:0 auto}
.hero-b h1{font-size:var(--text-3xl);letter-spacing:var(--tracking-display)}
.grid3{display:grid;grid-template-columns:repeat(3,1fr);gap:24px;padding:32px 0 48px}
@media(max-width:920px){.grid3{grid-template-columns:1fr}}
.cta{text-align:center;padding:32px 0 64px}
</style>
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<main id="content"><div class="container">
<section class="hero-b" data-od-id="hero-beneficios">
<p class="eyebrow">Beneficios · Por qué Precis</p>
<h1>Tu salud, sin fricción administrativa</h1>
<p class="lead">Menos llamadas, costes claros y resultados accesibles. Tres ventajas concretas.</p>
</section>
<section class="grid3" data-od-id="beneficios-lista">
<div class="card"><h2 style="font-size:var(--text-xl);margin-bottom:8px">Acceso inmediato</h2><p style="color:var(--muted);font-size:15px">Consulta citas, laboratorio e imagen con tu ID o tus apellidos. Sin ventanillas ni horarios.</p></div>
<div class="card"><h2 style="font-size:var(--text-xl);margin-bottom:8px">Costes transparentes</h2><p style="color:var(--muted);font-size:15px">Ve tu sede, prueba y horario antes de acudir. Sin sorpresas en la factura final.</p></div>
<div class="card"><h2 style="font-size:var(--text-xl);margin-bottom:8px">Seguimiento continuo</h2><p style="color:var(--muted);font-size:15px">Reprograma, conserva tu historial y comparte tus estudios con tu médico.</p></div>
</section>
<section class="cta" data-od-id="cta-beneficios"><a class="btn btn-primary" href="/webmedical/register-patient" data-od-id="cta-registro">Registrarme ahora</a>
<p style="color:var(--muted);font-size:14px;margin-top:12px">Toma dos minutos · Sin coste</p></section>
</div></main>
<%@include file="footer.jsp"%>
</div>
</body>
</html>
