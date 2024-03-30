<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Styles -->
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<!-- Bootstrap CDN Links -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>Labs</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

<div class="labs-box">
	<div class="labinfoentry">

			<form:form action="checklabs" modelAttribute="patient"> 
				
				<form:label path="firstName" class="monserrat">Enter your first name</form:label>
				<form:input path="firstName" />
				
				<form:label path="firstLastName" class="monserrat">Enter your last name</form:label>
				<form:input path="firstLastName" />
				
				<form:label path="secondLastName" class="monserrat">Enter your second last name</form:label>
				<form:input path="secondLastName" />
				
				<button type="submit" class="btn btn-light">Search</button>
			</form:form>
	</div>
</div>
	</div>
</body>
	<script src="resources/js/labsJs.js"></script>
</html>