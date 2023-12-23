package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import services.AppointmentsServices;


@Controller
public class MainController {
	
	
	//Get requests

	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("/benefits")
	public String benefits() {
		return "benefits";
	}
	
	@GetMapping("/medicines")
	public String medicines() {
		return "medicines";
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
	
	@GetMapping("/merchandise")
	public String merchandise() {
		return "merchandise";
	}
	
	@GetMapping("/appointmentchecking")
	public String appointmentchecking(Model model) {
		String appo = (String) model.getAttribute("appointment");
		System.out.println("por fin " + appo);
		return "appointmentchecking";
	}
	
	
	
	
	//Post requests
	@PostMapping("/check-appointment")
	public ModelAndView checkAppointment(@RequestParam("appointment") String appointment, RedirectAttributes ra) {
		
		AppointmentsServices apppontmentService = new AppointmentsServices();
		if(apppontmentService.checkAppointment(appointment)) {
			System.out.println("no se agrego nada");
			ra.addFlashAttribute("appointment", "0");
		} else {
			ra.addFlashAttribute("appointment", appointment);
		}
		
		
//		return "redirect:/appointmentchecking";
		return new ModelAndView("redirect:/appointmentchecking") ;
		
	}
	

}



