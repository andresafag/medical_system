<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/imaging-style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link rel="stylesheet" href="resources/css/imaging-style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>imaging list</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

<div class="imaging-box">
	
	<% try {  %>
		<% String s =  request.getContextPath()+"/resources/imaging/102/"; %>
		
		<% File f  =new File("/Users/Andres/javaProjects/Web_medical_system/webmedical/src/main/webapp/resources/imaging/"+request.getAttribute("imagingNumber")); %>
	
		<% String contents[] = f.list(); %>
		<% int req = (int) request.getAttribute("imagingNumber"); %>
		<% String length = String.valueOf(contents.length - 1); %>
		<c:set var="extension" value="<%=length %>" />
		<c:set var="contents" value="<%= contents %>" />
		<c:set var="requ" value="<%= req %>" />
		<div class="imagingBox">
		<c:forEach var = "i" begin = "0" end = "${extension}">
        	<img class="imaginglist" src="resources/imaging/${requ}/${contents[i]}"  />
      	</c:forEach>
		</div>
		
		
		<% } catch (NullPointerException nul){%>
			<p>You have no records of imaging</p>
		<% } %>
	
</div>
	
</div>
     
	

</body>
</html>