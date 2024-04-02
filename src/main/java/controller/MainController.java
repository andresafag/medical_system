package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import models.Appointment;
import models.BindingClass;
import models.Patient;


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
	public String appointments(@ModelAttribute("binding") BindingClass binding, @ModelAttribute("appointment") Appointment appointment) { 
		return "appointments";
	}
	
	@GetMapping("/labs")
	public String labs(@ModelAttribute("patient") Patient patient) {
		return "lab";
	}
	
	@GetMapping("/imaging")
	public String imaging() {
		return "imaging";
	}
	
	@GetMapping("/merchandise")
	public String merchandise(Model model) {
		model.addAttribute("paciente", new Patient()); 
		return "merchandise";
	}
	
	@GetMapping("/register-patient")
	public String registerPatient(Model model) {
		model.addAttribute("patient", new Patient()); 
		return "registerpatient";
	}
	


}
