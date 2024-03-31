package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import models.Appointment;

@Controller
public class ErrorsHandlers {
	
	
	@GetMapping("/errorpatienthandler")
	public String errorpatienthandler() {

		return "errorpatienthandler";
	}
}
