<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Styles -->
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
				<form:label path="firstName" class="monserrat" >First name</form:label>
				<form:input path="firstName"  placeholder="Juanito" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="secondName" class="monserrat">Second name</form:label>
				<form:input path="secondName" placeholder="Jaime" style="text-align:center;"/>
				</div>
				
				<div class="form-items">				
				<form:label path="firstLastName" class="monserrat">Last name</form:label>
				<form:input path="firstLastName" placeholder="Jimenez" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="secondLastName" class="monserrat">Second last name</form:label>
				<form:input path="secondLastName" placeholder="Gabino" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="age" class="monserrat">Age</form:label>
				<form:input path="age" value=" " style="text-align:center;"/>
				</div>
		
				<div class="form-items">
				<form:label path="gender" class="monserrat">Gender</form:label>
				<form:input path="gender" placeholder="M or F" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="dateOfBirth" class="monserrat">Date of birth</form:label>
				<form:input path="dateOfBirth" placeholder="1987-02-03" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="address" class="monserrat">Address</form:label>
				<form:input path="address" placeholder="2354 wetson street" style="text-align:center;"/>
				</div>
				
				<div class="form-items">
				<form:label path="phoneNumber" class="monserrat">Phone number</form:label>
				<form:input path="phoneNumber" value="" style="text-align:center;"/>
				</div>
				
				
				<form:button type="submit" style="margin:2%;" class="btn btn-info">Register patient</form:button>
				
			</form:form>
		</div>
		
		
	</div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>