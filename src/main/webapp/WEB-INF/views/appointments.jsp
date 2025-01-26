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
<link href="https://fonts.googleapis.com/css2?family=Spicy+Rice&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<!-- Bootstrap CDN Links-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>appointments</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>
	<h3 class="header spicy">📓 Check or schedule your appointment 📓</h3>
	<div class="appointments-box">
		
		<div class="check-appointment">
			
			<form:form action="check-appointment" modelAttribute="appointment"> 
				
				<form:input path="appointmentIdentification" class="inputBorder" type="number" placeholder="appointment id" required="required" />
				
				<button type="submit" class="btn btn-info">Go!</button>
			</form:form>
			
		</div>
		
		<div class="schedule-appointment" >
				 
				 <form:form action="schedule-appointment" modelAttribute="binding">
					
					<input type="hidden" name="_method" value="PUT">
						
					<form:input class="inputBorder" path="reason" name="reason" id="reason" type="text" placeholder="reason" required="required" />
					
					<form:input path="firstName" class="inputBorder" type="text" placeholder="first name" required="required"/>
					
					<form:input path="lastName" class="inputBorder" type="text" placeholder="last name" required="required" />
					
					<form:input path="secondLastName" class="inputBorder" type="text" placeholder="second surname" required="required" />
					
					<form:input path="specialty" class="inputBorder" type="text" placeholder="specialty" required="required" />
						
					
					<form:button type="submit" class="btn btn-info">Go!</form:button>
				 </form:form>
		
		</div>
		
	</div>
	<%@include file="footer.jsp"%>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/appointments.js"></script>
</html>
