let firstName = document.querySelector("#name")
let lastName = document.querySelector("#lastName")
let secondLastName = document.querySelector("#secondLastName")
let submit = document.querySelector("form")
let toolTipName = document.querySelector(".tooltiptextName")
let toolTipLastName = document.querySelector(".tooltiptextLastName")
let toolTipSecondLastName = document.querySelector(".tooltiptextSecondLastName")

let num =  [0,1,2,3,4,5,6,7,8,9]


submit.addEventListener("submit", function(e){
	for(var i = 0;i < 20;i++){
    if( firstName.value.includes(num[i]) || lastName.value.includes(num[i]) || secondLastName.value.includes(num[i]) ){
		e.preventDefault()
		if(firstName.value.includes(num[i])){
			toolTipName.classList.add("visible")
		setTimeout(() => {
 	 		toolTipName.classList.remove("visible")
		}, 2000);
		break;
		}
		
		if(lastName.value.includes(num[i])){
			toolTipLastName.classList.add("visible")
		setTimeout(() => {
 	 		toolTipLastName.classList.remove("visible")
		}, 2000);
		break;
		}
		
		if(secondLastName.value.includes(num[i])){
			toolTipSecondLastName.classList.add("visible")
		setTimeout(() => {
 	 		toolTipSecondLastName.classList.remove("visible")
		}, 2000);
		break;
		}

		
	}
} 
})

