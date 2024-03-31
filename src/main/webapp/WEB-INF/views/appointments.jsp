<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Styles -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik+Doodle+Shadow&display=swap" rel="stylesheet">
<!-- Bootstrap CDN Links-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>appointments</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

	<div class="appointments-box">
		<div class="check-appointment">
			<form:form action="check-appointment" modelAttribute="appointment"> 

				<form:label path="appointmentIdentification" class="monserrat">Enter an appointment number</form:label>
				<form:input path="appointmentIdentification" class="inputBorder" />
				
				<button type="submit" class="btn btn-info">Search appointment</button>
			</form:form>
			
		</div>
		
		<div class="schedule-appointment" >
				 
				 <form:form action="schedule-appointment" modelAttribute="binding">
				
						
					<form:label path="reason" for="reason" class="monserrat">Give us brief reason of the appointment</form:label>
					<form:input class="inputBorder" path="reason" name="reason" id="reason"  />
					
					<form:label path="firstName" class="monserrat">First name</form:label>
					<form:input path="firstName" class="inputBorder"/>
					
					<form:label path="lastName" class="monserrat">Last name</form:label>
					<form:input path="lastName" class="inputBorder" />
					
					<form:label path="secondLastName" class="monserrat">Second last name</form:label>
					<form:input path="secondLastName" class="inputBorder" />
					
					<form:label path="specialty" class="monserrat">Specialty</form:label>
					<form:input path="specialty" class="inputBorder" />
						
					
					<form:button type="submit" class="btn btn-info">Submit appointment</form:button>
				 </form:form>
		
		</div>
		
	</div>
	<%@include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript" src="resources/js/appointments.js"></script>
</html>
