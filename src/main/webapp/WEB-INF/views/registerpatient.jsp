<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link href="resources/css/register_patient.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link rel="stylesheet" href="resources/css/appointments-style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>Register patient here now</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

	<div class="registration-box">
		<div class="registration">
			<!--   <form action="registration" method="POST">
				<input type="hidden" name="_method" value=PUT></input> 
				
				
				<label for="firstName">Type in your first name</label>
				<input type="text" id="firstName" name="firstName">
				
				<label for="secondName">Type in your second name</label>
				<input type="text" id="secondName" name="secondName">
				
				<label for="lastName">Type in last name</label>
				<input type="text" id="lastName" name="lastName">
				
				<label for="secondLastName">Type in second last name</label>
				<input type="text" id="secondLastName" name="secondLastName">
				
				<label for="age">Type in age</label>
				<input type="text" id="age" name="age">
				
				<label for="dateOfBirth">Type in date of birth</label>
				<input type="text" id="dateOfBirth" name="dateOfBirth">
				
				<label for="gender">Type in gender</label>
				<input type="text" id="gender" name="gender">
				
				<label for="address">Type in address</label>
				<input type="text" id="address" name="address">
				
				<label for="phoneNumber">Type in phoneNumber</label>
				<input type="text" id="phoneNumber" name="phoneNumber">
				
		

				<button type="submit">Become a patient</button>
			</form>-->
			
			
			<form:form action="registration" modelAttribute="patient">
				
				<form:label path="firstName" class="monserrat">Type in your first name</form:label>
				<form:input path="firstName" />
				
				<form:label path="secondName" class="monserrat">Type in your second name</form:label>
				<form:input path="secondName" />
				
				<form:label path="firstLastName" class="monserrat">Type in last namer</form:label>
				<form:input path="firstLastName" />
				
				<form:label path="secondLastName" class="monserrat">Type in second last name</form:label>
				<form:input path="secondLastName" />
				
				<form:label path="age" class="monserrat">Type in age</form:label>
				<form:input path="age" />
				
				<form:label path="dateOfBirth" class="monserrat">Type in date of birth</form:label>
				<form:input path="dateOfBirth" />
				
				<form:label path="gender" class="monserrat">Type in gender</form:label>
				<form:input path="gender" />
			
				<form:label path="address" class="monserrat">Type in address</form:label>
				<form:input path="address" />
				
				<form:label path="phoneNumber" class="monserrat">Type in phoneNumber</form:label>
				<form:input path="phoneNumber" />
				
				<form:button type="submit" class="btn btn-light">Register patient</form:button>
				
			</form:form>
		</div>
		
		
	</div>

	</div>
</body>
</html>