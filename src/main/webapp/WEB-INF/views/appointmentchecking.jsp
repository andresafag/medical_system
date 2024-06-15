<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Styles -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link href="https://fonts.googleapis.com/css2?family=Spicy+Rice&display=swap" rel="stylesheet">
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik+Doodle+Shadow&display=swap" rel="stylesheet">
<!-- Bootstrap CDN Links -->
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
        <h3 class="monserrat">Appointment details</h3>
			<div class="appointmentdata">
				<p id="identifier"><strong>Appointment identifier:</strong> <c:out value="${identifier}"/></p>
				<p id="reason"><strong>Reason of the appointment:</strong> <c:out value="${reason}"/></p>
				<p id="intituition"><strong>Location:</strong> <c:out value="${intituition}"/></p>
				<p id="specialty"><strong>Specialty:</strong> <c:out value="${specialty}"/></p>
				<p id="doctorsname"><strong>Doctor's name:</strong> <c:out value="${doctorsname}"/></p>
				<p id="date"><strong>Date:</strong> <c:out value="${date}"/></p>
				<p id="time"><strong>Time: </strong><c:out value="${time}"/></p>
				<p id="address"><strong>Address:</strong> <c:out value="${address}"/></p>
				 <form:form action="delete-appointment" modelAttribute="appointment">
				 <input type="hidden" name="_method" value="DELETE">
				 <form:input path="appointmentIdentification" hidden="true" value="${identifier}" />
				 <form:button type="submit" class="btn btn-light">Delete appointment</form:button>
				 </form:form>
				<div>
					<button class="updatebtn btn btn-light" >Update appointment</button>
				</div>
			</div>
    	</c:when>
    	
    	<c:otherwise>
        	<p>No appointment registered under that number</p>
    	</c:otherwise>
	</c:choose>	

			
		</div>
		<%@include file="footer.jsp"%>
	</div>
</body>
<script type="text/javascript" src="resources/js/javascript.js"></script>
</html>