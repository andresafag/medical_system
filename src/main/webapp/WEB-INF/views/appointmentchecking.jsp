<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/appointments-style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<title>checking appointment</title>
</head>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>
		<div class="datacontainer">
		<c:choose>
   	 	<c:when test="${identifier gt 0}">
        <h3>Appointment details</h3>
			<div class="appointmentdata">
				<p><strong>Appointment identifier:</strong> <c:out value="${identifier}"/></p>
				<p><strong>Reason of the appointment:</strong> <c:out value="${reason}"/></p>
				<p><strong>Location:</strong> <c:out value="${intituition}"/></p>
				<p><strong>Specialty:</strong> <c:out value="${specialty}"/></p>
				<p><strong>Doctor's name:</strong> <c:out value="${doctorsname}"/></p>
				<p><strong>Date:</strong> <c:out value="${date}"/></p>
				<p><strong>Time: </strong><c:out value="${time}"/></p>
				<p><strong>Address:</strong> <c:out value="${address}"/></p>
			</div>
    	</c:when>
    	
    	<c:otherwise>
        	<p>No appointment registered under that number</p>
    	</c:otherwise>
	</c:choose>	
		
		
			
		</div>
	</div>
</body>
</html>