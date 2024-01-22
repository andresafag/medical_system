<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/imaging-style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>Merchandise</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

<div class="merchandise-box">
<div class="imagingdataentry">
		 <form:form action="testingpost" modelAttribute="paciente"> 
				<div class="fieldContainer">
				 	First name:<form:input path="firstName" /> 
				</div>
				<button type="submit" class="btn btn-light">Check the imaging results</button>
			</form:form>
	</div>
</div>


	</div>
</body>
</html>