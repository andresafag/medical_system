package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class differentcontroller {
	
	@GetMapping("/sease")
	public String home() {
		return "home";
	}
}
