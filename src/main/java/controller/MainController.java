package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {
	
	//Get requests ----------------------------------------------------------------------------------------------------------------------------------------------------------------

	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/benefits")
	public String benefits() {
		return "benefits";
	}
	
	
	@GetMapping("/appointments")
	public String appointments() {
		return "appointments";
	}
	
	@GetMapping("/labs")
	public String labs() {
		return "lab";
	}
	
	@GetMapping("/imaging")
	public String imaging() {
		return "imaging";
	}
	



}



