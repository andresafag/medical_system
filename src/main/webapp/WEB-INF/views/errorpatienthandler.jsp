<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Spicy+Rice&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>Missing fields</title>
</head>
<body>
	<% HashMap<String,String> errorAttributes = (HashMap<String,String>) request.getAttribute("invalidFields"); %>
	<% int invalidFieldsSize = errorAttributes.size(); %>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

	<c:set var="missingFieldHeader" value="<%= errorAttributes %>" />
	<div class="missingFieldsBox">
			<h3>These are the misssing fields:</h3>
	<c:forEach var="missing" items="${missingFieldHeader}">   
   			<div class="missingItems">
   				<p>${missing.key}</p>
   			</div>
	</c:forEach> 
		<button class="btnn" onclick="goBack()">Go back</button>
	</div>
	</div>
</body>
<script src="resources/js/missingFields.js"></script>
</html>