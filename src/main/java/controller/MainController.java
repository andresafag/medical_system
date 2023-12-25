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
import services.LabServices;


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
	

	
	
	@GetMapping("/labschecking")
	public String labschecking(Model model) {
		Long identifierConvertedToString = (Long) model.getAttribute("identifier");
		String labnameConvertedToString = String.valueOf(model.getAttribute("labname"));
		String labintituitionConvertedToString = String.valueOf(model.getAttribute("labintituition"));
		String addressConvertedToString = String.valueOf(model.getAttribute("address"));
		String dateConvertedToString = String.valueOf(model.getAttribute("date"));
		String timeConvertedToString = String.valueOf(model.getAttribute("time"));
		
		return "labschecking";
	}
	
	
	@PostMapping("/checklabs")
	public ModelAndView checkLabs(@RequestParam("name") String patientName, RedirectAttributes ra) {
		LabServices labService = new LabServices();
		
		if (labService.checkLabResults(patientName).size() > 0) {
//			System.out.println("este es " + labService.checkLabResults(patientName).get("identification").getClass());
			ra.addFlashAttribute("identifier",labService.checkLabResults(patientName).get("identification"));
			ra.addFlashAttribute("labname", labService.checkLabResults(patientName).get("labname"));
			ra.addFlashAttribute("labintituition",labService.checkLabResults(patientName).get("labintituition"));
			ra.addFlashAttribute("address", labService.checkLabResults(patientName).get("address"));
			ra.addFlashAttribute("date", labService.checkLabResults(patientName).get("date"));
			ra.addFlashAttribute("time", labService.checkLabResults(patientName).get("time"));
		} else {
			ra.addFlashAttribute("identifier", 0L);
			System.out.println(labService.checkLabResults(patientName).get("identification"));
		}
		
		
		

		return new ModelAndView("redirect:/labschecking") ;
		
	}
	
	
	
	
	
	
	
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
		
		AppointmentsServices apppontmentService = new AppointmentsServices();
		
		if (apppontmentService.checkAppointment(appointment).size() > 0) {
			ra.addFlashAttribute("identifier", apppontmentService.checkAppointment(appointment).get("appointmentIdentification"));
			ra.addFlashAttribute("reason", apppontmentService.checkAppointment(appointment).get("reason"));
			ra.addFlashAttribute("intituition", apppontmentService.checkAppointment(appointment).get("intituition"));
			ra.addFlashAttribute("specialty", apppontmentService.checkAppointment(appointment).get("specialty"));
			ra.addFlashAttribute("doctorsname", apppontmentService.checkAppointment(appointment).get("doctorsname"));
			ra.addFlashAttribute("date", apppontmentService.checkAppointment(appointment).get("date"));
			ra.addFlashAttribute("time", apppontmentService.checkAppointment(appointment).get("time"));
			ra.addFlashAttribute("address", apppontmentService.checkAppointment(appointment).get("address"));
		} else {
			ra.addFlashAttribute("identifier", 0L);
		}


		return new ModelAndView("redirect:/appointmentchecking") ;
		
	}
	
	
	

	

}



