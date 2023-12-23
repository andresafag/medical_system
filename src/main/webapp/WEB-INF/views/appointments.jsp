<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/navigator-style.css" rel="stylesheet">
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
				<label for="appointment">Type in your appointment number</label>
				<input id="appointment" type="text" name="appointment">
				<button type="submit">Check appointment</button>
			</form>
		</div>
		
		<div class="schedule-appointment">
			<form action="schedule-appointment">
				
			</form>
		</div>
	</div>


	</div>
</body>
</html>