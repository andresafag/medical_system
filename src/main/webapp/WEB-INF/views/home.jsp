<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/navigator-style.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik+Doodle+Shadow&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>
<!-- underneath I will place cards such as How to benefit from service, medicines, appointments, Diagnostic Imaging, Lab tests -->
	<div class="card-container">
	
	<div class="card" style="width: 18rem;background-color:antiquewhite;">
  <img src="resources/images/hospital.png">
  <div class="card-body">
    <h5 class="card-title monserrat">Benefits</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="/webmedical/benefits" class="btn btn-light">Get to know the benefits</a>
  </div>
</div>


<div class="card" style="width: 18rem;background-color:antiquewhite;">
  <img src="resources/images/stetoscope.png">
  <div class="card-body">
    <h5 class="card-title monserrat">Appointments</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="/webmedical/appointments" class="btn btn-light">Appointments checking</a>
  </div>
</div>


	<div class="card" style="width: 18rem;background-color:antiquewhite;">
 	<img src="resources/images/blood-test.png">
  <div class="card-body">
    <h5 class="card-title monserrat">Labs</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="/webmedical/labs" class="btn btn-light">Labs results</a>
  </div>
</div>

	<div class="card" style="width: 18rem;background-color:antiquewhite;">
 	<img src="resources/images/x-rays.png">
  <div class="card-body">
    <h5 class="card-title monserrat">Diagnostic Imaging</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="/webmedical/imaging" class="btn btn-light">Save or print out X-rays</a>
  </div>
</div>

</div>

</div>


<div class="footer-container">
	<div class="vl">
		<img src="resources/images/caduceus-symbol.png" alt="medicalsymbol" width="60" height="80" class="d-inline-block align-text-top">
		<span>PRECIS MEDICAL</span>
	</div>
	
	<div class="vl">
		<a class="bl" href="#">Us</a>
		<a class="bl" href="#">Afiliates</a>
		<a class="bl" href="#">Contact us</a>
	</div>
	
	
	<div class="vl">
		<a class="bl" href="#">Join us</a>
		<a class="bl" href="#">Transparency law</a>
		<a class="bl" href="#">Our mission</a>
		<a class="bl" href="#">Our vision</a>
	</div>

</div>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
