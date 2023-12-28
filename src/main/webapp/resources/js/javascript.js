const updateBtn = document.querySelector(".updatebtn");
const containerBox = document.querySelector(".datacontainer");
const containerData = document.querySelector(".appointmentdata");
const identifierTxt = document.querySelector("#identifier");
const reasonTxt = document.querySelector("#reason");
const intituitionTxt = document.querySelector("#intituition");
const specialtyTxt = document.querySelector("#specialty");
const doctorsnameTxt = document.querySelector("#doctorsname");
const dateTxt = document.querySelector("#date");
const timeTxt = document.querySelector("#time");
const addressTxt = document.querySelector("#address");



const updateData = () =>{
		  
	   containerData.innerHTML = '';
	   
	   let getIdentifier = identifierTxt.innerHTML.split(" ")[2];
  
  	   let template = `<form id="form" action="update-appointment" method="POST">
  				<input type="hidden" name="_method" value=PATCH></input>
  				<p id="identifier">${identifierTxt.innerHTML}</p>
  				<input type="text" name="identifier" id="identifier" hidden="true" value="${getIdentifier}"/>
  				<p id="reason" style="display:inline-block;"><strong>Reason of the appointment: </strong></p>
  				<input type="text" name="reason" id="reason"/>
				<p id="intituition">${intituitionTxt.innerHTML}</p>
				<p id="specialty" style="display:inline-block;"><strong>Specialty: </strong></p>
				<input type="text" name="specialty" id="specialty"/>
				<p id="doctorsname">${doctorsnameTxt.innerHTML}</p>
				<p id="date">${dateTxt.innerHTML}</p>
				<p id="time">${timeTxt.innerHTML}</p>
				<p id="address">${addressTxt.innerHTML}</p>
				<button type="submit">Update appointment now</button>
 				`
  
 	containerData.innerHTML += template
 	
 	
 	let form = document.querySelector("#form")
 	
 	
  form.addEventListener("submit", function(e){
	  e.preventDefault()

	  let url = "update-appointment";
	  	fetch(url, {
   	 	method: "PATCH",
  		body: new URLSearchParams(new FormData(form)),
  		 headers: {
    	'Content-type': 'application/x-www-form-urlencoded',
  },
  		}).then((response)=>{
			  let customerHeader = ""
			   for (var pair of response.headers.entries()) {
      				if(pair[0] == "custom-header"){
						  customerHeader = pair[1]
					  }
    			}
    			if(customerHeader == "passed"){
					 containerData.innerHTML = '';
					 let resultTemplate =  `<h5>The information has been updated<h5>`
					 setTimeout(function myGreeting() {
  						window.location = "http://localhost:8080/webmedical/"
  						window.onbeforeunload = function() {
						 window.location = "http://localhost:8080/webmedical/"
					  };
					 }, 3000);
					 containerData.innerHTML += resultTemplate
					 
				} 
		  })
  })
	
	
};


updateBtn.addEventListener("click", updateData);






