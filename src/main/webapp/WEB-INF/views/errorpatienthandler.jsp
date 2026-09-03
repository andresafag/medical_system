<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Revisa tu registro</title>
<link href="resources/css/style.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
.err{display:flex;gap:12px;align-items:center;color:var(--danger);font-weight:600}
ul.missing{margin:16px 0;padding:0;list-style:none}ul.missing li{padding:12px 0;border-top:1px solid var(--border);font-size:15px}ul.missing li a{text-decoration:underline}
</style>
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<% HashMap<String,String> errorAttributes = (HashMap<String,String>) request.getAttribute("invalidFields"); %>
<% int invalidFieldsSize = (errorAttributes == null ? 0 : errorAttributes.size()); %>
<main id="content"><div class="wrap-narrow">
<c:set var="missingFieldHeader" value="<%= errorAttributes %>" />
<section class="card" data-od-id="error-registro">
<p class="err"><span aria-hidden="true">◉</span> Revisa <%= invalidFieldsSize %> campo(s)</p>
<h1 style="font-size:var(--text-2xl);margin-top:8px">Te faltan datos por completar</h1>
<p style="color:var(--muted)">Guardamos lo que ya escribiste. Vuelve al formulario para corregir.</p>
<ul class="missing">
<c:forEach var="missing" items="${missingFieldHeader}">
<li><a href="/webmedical/register-patient">${missing.key}</a><br /><span style="color:var(--muted);font-size:14px">${missing.value}</span></li>
</c:forEach>
</ul>
<div style="display:flex;gap:12px;margin-top:20px;flex-wrap:wrap">
<a class="btn btn-primary" href="/webmedical/register-patient" data-od-id="cta-volver-form">Volver al formulario</a>
<a class="btn btn-secondary" href="/webmedical/">Ir al inicio</a>
</div>
</section>
</div></main>
<%@include file="footer.jsp"%>
</div>
</body>
</html>
