<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Styles -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Spicy+Rice&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<!-- Bootstrap CDN Links-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>imaging</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>
	 <h3 class="header spicy"><img alt="x-ray" src="resources/images/x-rays.png" style="height:60px;width:auto;"> X rays</h3>
<div class="imaging-box">
	<div class="imagingdataentry">
		<form action="checkImaging" method="POST">
				<div class="fieldContainer">
					<input id="name" type="text" name="name" placeholder="first name" class="inputBorder" >
 					<!-- <span class="tooltiptextName">This field should not include numbers</span> --> 
				</div>
				<div class="fieldContainer">
					<input id="lastName" type="text" name="lastName" class="inputBorder" placeholder="last name">
					<!-- <span class="tooltiptextLastName">This field should not include numbers</span> -->
				</div>
				<div class="fieldContainer">
					<input id="secondLastName" type="text" name="secondLastName" placeholder="second last name" class="inputBorder" >
					<!-- <span class="tooltiptextSecondLastName">This field should not include numbers</span> -->
				</div>
				<button type="submit" class="btn btn-info">Go!</button>
			</form>
	</div>
</div>
     <%@include file="footer.jsp"%>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="resources/js/imagingJs.js"></script>
</html>