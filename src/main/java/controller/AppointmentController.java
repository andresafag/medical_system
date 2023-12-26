package controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import models.Appointment;
import services.AppointmentsServices;


@Controller
public class AppointmentController {
	
	
	
	@GetMapping("/appointmentchecking")
	public String appointmentchecking(Model model) {

		Long identifierConvertedToString = (Long) model.getAttribute("identifier");
		String reasonConvertedToString = String.valueOf(model.getAttribute("reason")); 
		String intituitionconvertedToString = String.valueOf(model.getAttribute("intituition")); 
		String specialtyConvertedToString = String.valueOf(model.getAttribute("specialty")); 
		String doctornameConvertedToString = String.valueOf(model.getAttribute("doctorsname")); 
		String dateConvertedToString = String.valueOf(model.getAttribute("date")); 
		String timeConvertedToString = String.valueOf(model.getAttribute("time")); 
		String addressConvertedToString = String.valueOf(model.getAttribute("address")); 
		return "appointmentchecking";
	}
	

	
	
	
	//Post requests ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	@PostMapping("/check-appointment")
	public ModelAndView checkAppointment(@RequestParam("appointment") String appointment, RedirectAttributes ra) {
		
		AppointmentsServices appointmentService = new AppointmentsServices();
		
		if (appointmentService.checkAppointment(appointment).size() > 0) {
			ra.addFlashAttribute("identifier", appointmentService.checkAppointment(appointment).get("appointmentIdentification"));
			ra.addFlashAttribute("reason", appointmentService.checkAppointment(appointment).get("reason"));
			ra.addFlashAttribute("intituition", appointmentService.checkAppointment(appointment).get("intituition"));
			ra.addFlashAttribute("specialty", appointmentService.checkAppointment(appointment).get("specialty"));
			ra.addFlashAttribute("doctorsname", appointmentService.checkAppointment(appointment).get("doctorsname"));
			ra.addFlashAttribute("date", appointmentService.checkAppointment(appointment).get("date"));
			ra.addFlashAttribute("time", appointmentService.checkAppointment(appointment).get("time"));
			ra.addFlashAttribute("address", appointmentService.checkAppointment(appointment).get("address"));
		} else {
			ra.addFlashAttribute("identifier", 0L);
		}


		return new ModelAndView("redirect:/appointmentchecking") ;
		
	}
	
	
	
	//Delete requests ----------------------------------------------------------------------------------------------------------------------------------------------------------------

	
	@DeleteMapping("/delete-appointment")
	public ModelAndView deleteAppointment(@RequestParam("identifier") String identifier, RedirectAttributes ra) {
		String page = "";
		System.out.println("done " + identifier);
		AppointmentsServices appointmentService = new AppointmentsServices();
		
		
		if (appointmentService.deleteAppointment(identifier) > 0) {
			page = "redirect:/";
		}
		
		return new ModelAndView(page);
		
		
	}
	
	
	
	//Update requests ----------------------------------------------------------------------------------------------------------------------------------------------------------------

	
	@PatchMapping("/update-appointment")
	public  ResponseEntity<String> updateAppointment(@RequestBody MultiValueMap<String,String> paramMap) {
		String verifiedHeader = "";
		AppointmentsServices appointmentService = new AppointmentsServices();
		verifiedHeader = (appointmentService.updateAppointment(paramMap.get("identifier").get(0), paramMap.get("reason").get(0), paramMap.get("specialty").get(0))) > 0 ? "passed"  : "failed" ;
		
		return  ResponseEntity.ok()
				.header("Custom-Header", verifiedHeader)
		        .body("Custom header set");
	}
	
}

















