<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <!-- Styles -->
<link href="resources/css/style.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="resources/images/caduceus-symbol.png">
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik+Doodle+Shadow&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Spicy+Rice&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Spicy+Rice&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<!-- Bootstrap CDN links -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/8b8b86760e.js" crossorigin="anonymous"></script>
<body>
	<div class="container-fluid">
	<%@include file="navigation-bar.jsp"%>
	
	<div class="card-container">
	

<div class="card benefits" style="width: 18rem;height:20rem;">
  <div class="card-body">
      <h5 class="card-title spicy">Benefits</h5>
  </div>
</div>


<div class="card appointments" style="width: 18rem;height:20rem;">
  <div class="card-body">
    <h5 class="card-title spicy">Appointments</h5>
  </div>
</div>


	<div class="card labresults" style="width: 18rem;height:20rem;">
  <div class="card-body">
    <h5 class="card-title spicy">Labs</h5>
  </div>
</div>

	<div class="card imaging" style="width: 18rem;height:20rem;">
  <div class="card-body">
    <h5 class="card-title spicy" style="color:white;">Diagnostic Imaging</h5>
  </div>
</div>

</div>
<%@include file="footer.jsp"%>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
	let cards = document.querySelectorAll(".card")

	for (var i = 0; i < cards.length; i++) {
	
	cards[i].addEventListener("click", (e)=>{
		console.log(e.target.offsetParent.className.split(" ")[1])
		
		switch(e.target.offsetParent.className.split(" ")[1]) {
		  case "benefits":
			  window.location.href = "/webmedical/benefits";
		    break;
		  case "appointments":
			  window.location.href = "/webmedical/appointments";
		    break;
		  case "labresults":
			  window.location.href = "/webmedical/labs";
		    break;
		  case "imaging":
			  window.location.href = "/webmedical/imaging";
			break
		  default:
			  window.location.href = "/webmedical/";
			} 
		})
	}

</script>
</html>
