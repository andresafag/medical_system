<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik+Doodle+Shadow&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/labs-style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>checking labs</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>
		<div class="datacontainer">
		<c:choose>
   	 	<c:when test="${identifier gt 0}">
        <h3 class="monserrat">Lab details</h3>
			<div class="labsdata">
				<p><strong><c:out value="Lab's identifier: "/></strong> ${identifier}</p>
				<p><strong><c:out value="Lab's name: "/></strong> ${labname}</p>
				<p><strong><c:out value="Intituition: "/></strong> ${labintituition}</p>
				<p><strong><c:out value="Address "/></strong> ${address}</p>
				<p><strong><c:out value="Date "/></strong> ${date}</p>
				<p><strong><c:out value="Time: "/></strong>${time}</p>
			</div>
    	</c:when>
    	
    	<c:otherwise>
        	<p>No existe alg�n laboratorio de ese usuario</p>
    	</c:otherwise>
	</c:choose>	
			
		</div>
	</div>
</body>
</html>