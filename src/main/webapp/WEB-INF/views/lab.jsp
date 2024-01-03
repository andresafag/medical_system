<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link href="resources/css/labs-style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/labs-style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>Labs</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

<div class="labs-box">
	<div class="labinfoentry">
		<form action="checklabs" method="POST">
				<label class="monserrat" for="name">Enter your first name </label>
				<input id="name" type="text" name="name">
				<label class="monserrat"  for="lastName">Enter your last name </label>
				<input id="lastName" type="text" name="lastName">
				<label class="monserrat"  for="secondLastName">Enter your second last name </label>
				<input id="secondLastName" type="text" name="secondLastName">
				<button type="submit" class="btn btn-light">Check lab results</button>
				
			</form>
	</div>
</div>


	</div>
</body>
</html>