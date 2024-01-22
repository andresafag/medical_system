let submit = document.querySelector("form")





/*
submit.addEventListener("submit", function(e){
	e.preventDefault()
	
	
	fetch("checkImaging", {
		method:"POST",
		body: new URLSearchParams(new FormData(submit)),
		 headers: {
    	'Content-type': 'application/x-www-form-urlencoded',
  },
	})
	.then(response=>{
		return response.blob()
	})
	.then(data =>{
		document.querySelector(".img").src = URL.createObjectURL(data)
	})
  	
	
})*/