<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="es-ES">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Precis Medical — Visor de imagen</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
.viewer{display:grid;grid-template-columns:280px 1fr;gap:24px;align-items:start}
@media(max-width:920px){.viewer{grid-template-columns:1fr}}
.thumbs{display:flex;flex-direction:column;gap:12px}
.thumb{border:1px solid var(--border);border-radius:var(--radius-sm);padding:10px;display:flex;gap:12px;align-items:center;background:var(--surface);width:100%;text-align:left;font:inherit;min-height:44px;cursor:pointer}
.thumb[aria-selected="true"]{border-color:var(--accent);box-shadow:var(--focus-ring)}
.thumb-art{width:56px;height:56px;border-radius:8px;background:color-mix(in oklab,var(--fg),transparent 94%);display:grid;place-items:center;color:var(--muted);font-family:var(--font-mono);font-size:var(--text-xs);flex:none;overflow:hidden}
.thumb-art img{width:100%;height:100%;object-fit:cover}
.main-img{background:var(--surface);border:1px solid var(--border);border-radius:var(--radius-md);padding:20px;text-align:center}
.main-img img{width:100%;max-height:60vh;object-fit:contain;border-radius:8px;background:color-mix(in oklab,var(--fg),transparent 94%)}
.meta{font-family:var(--font-mono);font-size:var(--text-xs);color:var(--muted)}
.controls{display:flex;gap:12px;justify-content:space-between;align-items:center;margin-top:16px;flex-wrap:wrap}
</style>
</head>
<body>
<div class="container-fluid">
<%@include file="navigation-bar.jsp"%>
<main id="content"><div class="wrap-wide">
<p class="crumbs"><a href="/webmedical/">Inicio</a> / <a href="/webmedical/imaging">Imagen</a> / Visor</p>
<% try { %>
<% File f = new File(application.getRealPath("/resources/imaging/") + request.getAttribute("imagingNumber")); %>
<% String contents[] = f.list(); %>
<% int req = (int) request.getAttribute("imagingNumber"); %>
<% String length = String.valueOf(contents.length - 1); %>
<c:set var="extension" value="<%=length %>" />
<c:set var="contents" value="<%= contents %>" />
<c:set var="requ" value="<%= req %>" />
<h1 style="font-size:var(--text-2xl)" data-od-id="titulo-visor">Estudio <c:out value="${requ}"/></h1>
<p style="color:var(--muted)"><c:out value="${extension + 1}"/> imágenes · Usa ← → para navegar</p>
<div class="viewer" style="margin-top:24px" data-od-id="visor">
<div class="card thumbs" role="listbox" aria-label="Miniaturas" data-od-id="miniaturas">
<c:forEach var="i" begin="0" end="${extension}">
<button class="thumb" aria-selected="${i == 0 ? 'true' : 'false'}" data-src="resources/imaging/${requ}/${contents[i]}" data-t="${contents[i]}" type="button"><span class="thumb-art"><img src="resources/imaging/${requ}/${contents[i]}" alt="${contents[i]}" loading="lazy" /></span><span><strong style="font-size:14px"><c:out value="${contents[i]}"/></strong><br /><span class="meta">RX · <c:out value="${requ}"/></span></span></button>
</c:forEach>
</div>
<div class="main-img" data-od-id="imagen-principal">
<img id="mainImg" src="resources/imaging/${requ}/${contents[0]}" alt="Imagen principal del estudio" />
<p class="meta" id="cap" style="margin-top:12px"><c:out value="${contents[0]}"/></p>
<div class="controls">
<button class="btn btn-secondary" id="prev" type="button">← Anterior</button>
<div style="display:flex;gap:12px"><a class="btn btn-secondary" href="/webmedical/imaging">Volver</a><a class="btn btn-primary" id="dl" href="resources/imaging/${requ}/${contents[0]}" download>Descargar</a></div>
<button class="btn btn-secondary" id="next" type="button">Siguiente →</button>
</div>
</div>
</div>
<% } catch (Exception nul){%>
<section class="empty">
<h2 style="font-size:var(--text-lg)">Sin registros de imagen</h2>
<p style="color:var(--muted);font-size:15px">You have no records of imaging. Verifica los apellidos o agenda un estudio.</p>
<div style="display:flex;gap:12px;justify-content:center;margin-top:16px;flex-wrap:wrap">
<a class="btn btn-secondary" href="/webmedical/imaging">Reintentar búsqueda</a>
<a class="btn btn-secondary" href="/webmedical/">Ir al inicio</a>
</div>
</section>
<% } %>
</div></main>
<%@include file="footer.jsp"%>
</div>
<script>
var items=Array.prototype.slice.call(document.querySelectorAll('.thumb'));var i=0;var main=document.getElementById('mainImg');var cap=document.getElementById('cap');var dl=document.getElementById('dl');
function show(n){if(!items.length||!main)return;i=(n+items.length)%items.length;items.forEach(function(b,k){b.setAttribute('aria-selected',k===i);});var s=items[i].getAttribute('data-src');var t=items[i].getAttribute('data-t');main.src=s;main.alt='Vista previa · '+t;cap.textContent=t;dl.href=s;dl.setAttribute('download',t);}
items.forEach(function(b,k){b.addEventListener('click',function(){show(k);});});
var pv=document.getElementById('prev'),nx=document.getElementById('next');
if(pv)pv.addEventListener('click',function(){show(i-1);});
if(nx)nx.addEventListener('click',function(){show(i+1);});
document.addEventListener('keydown',function(e){if(e.key==='ArrowLeft')show(i-1);if(e.key==='ArrowRight')show(i+1);});
</script>
</body>
</html>
