<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link rel="stylesheet" href="resources/css/imaging-style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>imaging</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

<div class="imaging-box">
	<div class="imagingdataentry">
		<form action="checkImaging" method="POST">
				<div class="fieldContainer">
					<label class="monserrat" for="name">Enter your first name</label>
					<input id="name" type="text" name="name">
 					<!-- <span class="tooltiptextName">This field should not include numbers</span> --> 
				</div>
				<div class="fieldContainer">
					<label class="monserrat"  for="lastName">Enter your last name</label>
					<input id="lastName" type="text" name="lastName">
					<!-- <span class="tooltiptextLastName">This field should not include numbers</span> -->
				</div>
				<div class="fieldContainer">
					<label class="monserrat"  for="secondLastName">Enter your second last name</label>
					<input id="secondLastName" type="text" name="secondLastName">
					<!-- <span class="tooltiptextSecondLastName">This field should not include numbers</span> -->
				</div>
				<button type="submit" class="btn btn-light">Check the imaging results</button>
			</form>
	</div>
</div>
	<!-- <img src="<%= request.getContextPath() %>/resources/imaging/2/arm.jpg"/> -->
	
	<% String s =  request.getContextPath()+"/resources/imaging/2/"; %>

	
	<% File f  =new File("/Users/Andres/javaProjects/Web_medical_system/webmedical/src/main/webapp/resources/imaging"); %>
	
	<% String contents[] = f.list(); %>
	<% String lazo = String.valueOf(contents.length); %>
	<% out.println(lazo); %>
	
	<c:forEach var = "i" begin = "0" end = "${new File('/Users/Andres/javaProjects/Web_medical_system/webmedical/src/main/webapp/resources/imaging').list().length}">
         Item <c:out value = "ses"/><p>
      </c:forEach>
	
	<div class="imagingdiv">

	<img class="img"/>

	</div>
</body>
<script src="resources/js/imagingJs.js"></script>
</html>