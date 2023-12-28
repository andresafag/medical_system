const form = document.querySelector(".schedule-appointment form")
const appointmentsBox = document.querySelector(".appointments-box")

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
			console.log(response)
						  let customerHeader = ""
			   for (var pair of response.headers.entries()) {
      				if(pair[0] == "custom-header"){
						  customerHeader = pair[1]
					  }
    			}
    			if(customerHeader == "saved"){
					 appointmentsBox.innerHTML = '';
					 let resultTemplate =  `<h5>The information has been saved successfully<h5>`
					 setTimeout(function myGreeting() {
  						window.location = "http://localhost:8080/webmedical/"
  						window.onbeforeunload = function() {
						 window.location = "http://localhost:8080/webmedical/"
					  };
					 }, 3000);
					 containerData.innerHTML += resultTemplate
					 
				} else if (customerHeader == "no patient") {
					window.location = "http://localhost:8080/webmedical/register-patient"
					
				}
		  })
  })