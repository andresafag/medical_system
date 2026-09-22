<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Imagen diagnóstica</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<main id="content"><div class="wrap-mid">
<p class="crumbs"><a href="/webmedical/">Inicio</a> / Imagen</p>
<section class="card" data-od-id="busqueda-imagen">
<p class="eyebrow">Imagen · POST /checkImaging</p>
<h1 style="font-size:var(--text-2xl)">Imagen diagnóstica</h1>
<p style="color:var(--muted)">Mismo patrón que laboratorio: nombre y dos apellidos para localizar tus estudios.</p>
<form action="checkImaging" method="POST" id="f">
<div class="field"><label for="n">Nombre</label><input class="input" id="n" name="name" placeholder="Ej.: María" required autocomplete="given-name" /></div>
<div class="field"><label for="a1">Primer apellido</label><input class="input" id="a1" name="lastName" placeholder="Ej.: García" required autocomplete="family-name" /></div>
<div class="field"><label for="a2">Segundo apellido</label><input class="input" id="a2" name="secondLastName" placeholder="Ej.: López" required /></div>
<button class="btn btn-primary" style="width:100%;margin-top:20px" type="submit" data-od-id="cta-buscar-imagen">Buscar estudios</button>
<p class="field-help" style="margin-top:12px">Verás miniaturas con modalidad y fecha antes de abrir el visor.</p>
</form>
</section>
</div></main>
<%@include file="footer.jsp"%>
</div>
</body>
</html>
