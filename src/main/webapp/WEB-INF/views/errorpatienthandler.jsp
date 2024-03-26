<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link href="resources/css/styles.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<% HashMap<String,String> errorAttributes = (HashMap<String,String>) request.getAttribute("invalidFields"); %>
	<% int invalidFieldsSize = errorAttributes.size(); %>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>

	<c:set var="missingFieldHeader" value="<%= errorAttributes %>" />
	<div>
	<c:forEach var="country" items="${missingFieldHeader}">   
   			<span>este es ${country.key}</span>
	</c:forEach> 
	</div>
	</div>
</body>
</html>