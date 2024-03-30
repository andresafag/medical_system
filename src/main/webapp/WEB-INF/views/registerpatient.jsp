<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Styles -->
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<!-- Bootstrap CDN Links -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>Register patient here now</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

	<div class="registration-box">
		<div class="registration">
			
			<form:form action="registration" modelAttribute="patient" method="POST">
				
				<div class="form-items">
				<form:label path="firstName" class="monserrat" >Type in your first name</form:label>
				<form:input path="firstName"  placeholder="Juanito" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="secondName" class="monserrat">Type in your second name</form:label>
				<form:input path="secondName" placeholder="Jaime" style="text-align:center;"/>
				</div>
				
				<div class="form-items">				
				<form:label path="firstLastName" class="monserrat">Type in last name</form:label>
				<form:input path="firstLastName" placeholder="Jimenez" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="secondLastName" class="monserrat">Type in second last name</form:label>
				<form:input path="secondLastName" placeholder="Gabino" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="age" class="monserrat">Type in your age</form:label>
				<form:input path="age" placeholder="25" style="text-align:center;"/>
				</div>
		
				<div class="form-items">
				<form:label path="gender" class="monserrat">Type in a gender</form:label>
				<form:input path="gender" placeholder="M or F" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="dateOfBirth" class="monserrat">Type in your date of birth</form:label>
				<form:input path="dateOfBirth" placeholder="1987-02-03" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="address" class="monserrat">Type in an address</form:label>
				<form:input path="address" placeholder="2354 wetson street" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="phoneNumber" class="monserrat">Type in your phone number</form:label>
				<form:input path="phoneNumber" placeholder="3128779999" style="text-align:center;"/>
				</div>
				
				
				<form:button type="submit" style="margin:2%;" class="btn btn-light">Register patient</form:button>
				
			</form:form>
		</div>
		
		
	</div>

	</div>
</body>
</html>