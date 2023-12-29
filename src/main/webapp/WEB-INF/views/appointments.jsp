<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik+Doodle+Shadow&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/appointments-style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>appointments</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

	<div class="appointments-box">
		<div class="check-appointment">
			<form action="check-appointment" method="POST">
				<label for="appointment" class="monserrat">Enter an appointment number</label>
				<input id="appointment" type="text" name="appointment">
				<button type="submit" class="btn btn-light">Check appointment</button>
			</form>
		</div>
		
		<div class="schedule-appointment" >
			<form action="schedule-appointment" method="POST">
				<input type="hidden" name="_method" value=PUT></input> 
				
				<label for="reason" class="monserrat">Give us brief reason of the appointment</label>
				<input type="text" id="reason" name="reason">
				
				<label for="firstName" class="monserrat">First name</label>
				<input type="text" id="firstName" name="firstName">
				
				<label for="lastName" class="monserrat">Last name</label>
				<input type="text" id="lastName" name="lastName">
				
				<label for="secondLastName" class="monserrat">Second last name</label>
				<input type="text" id="secondLastName" name="secondLastName">
				
				
				<label for="specialty" class="monserrat">Medical specialty</label>
				<input type="text" id="specialty" name="specialty">
				<button type="submit" class="btn btn-light">Submit appointment</button>
			</form>
		</div>
	</div>
	<div class="waiting">
	</div>

	</div>
</body>
<script type="text/javascript" src="resources/js/appointments.js"></script>
</html>
