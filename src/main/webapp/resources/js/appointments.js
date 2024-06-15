const form = document.querySelector(".schedule-appointment form")
const appointmentsBox = document.querySelector(".appointments-box")
const headerClass = document.querySelector(".header")
const appointmentIdentification = document.querySelector("#appointmentIdentification")

window.addEventListener("load", ()=>{
	appointmentIdentification.setAttribute("value","")
})




  form.addEventListener("submit", function(e){
	  e.preventDefault()

	  let url = "schedule-appointment";
	  	fetch(url, {
   	 	method: "PUT",
  		body: new URLSearchParams(new FormData(form)),
  		 headers: {
    	'Content-type': 'application/x-www-form-urlencoded',
  },
  		}).then((response)=>{
    			if(response.status == 200){
					 appointmentsBox.innerHTML = '';
					 headerClass.innerHTML = '';
					 let resultTemplate =  `<h5>The information has been saved successfully<h5>`
					 setTimeout(function myGreeting() {
  						window.location = "http://localhost:8080/webmedical/"
  						window.onbeforeunload = function() {
						 window.location = "http://localhost:8080/webmedical/"
					  };
					 }, 3000);
						appointmentsBox.innerHTML += resultTemplate
					 
				} else  {
					window.location = "http://localhost:8080/webmedical/register-patient"
					
				}
		  })
  })
  
  

 /*
form.addEventListener("submit", function(e){
	  e.preventDefault()
	  console.log(document.querySelector(".raz").value)
	  let url = "schedule-appointment";
	  	fetch(url, {
   	 	method: "POST",
   	 	 headers: {
    	'Content-type': 'application/x-www-form-urlencoded',
  },
  		body: new URLSearchParams(new FormData(form)),
  		 headers: {
    	'Content-type': "text/html; charset=UTF-8",
  },
  		}).then(response=>{
			  console.log(response)
		  })

  }) */
  
  