package controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;
import models.Appointment;
import models.BindingClass;
import models.Patient;
import services.AppointmentsServices;
import services.PatientServices;


@Controller
public class AppointmentController {
	
	@GetMapping("/appointmentchecking")
	public String appointmentchecking(Model model, @ModelAttribute("appointment") Appointment appointment) {

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
	public ModelAndView checkAppointment(@ModelAttribute("appointment") Appointment appointment, RedirectAttributes ra) {
		
		AppointmentsServices appointmentService = new AppointmentsServices();

		
		if (appointmentService.checkAppointment(appointment.getAppointmentIdentification()).size() > 0) {
			ra.addFlashAttribute("identifier", appointmentService.checkAppointment(appointment.getAppointmentIdentification()).get("appointmentIdentification"));
			ra.addFlashAttribute("reason", appointmentService.checkAppointment(appointment.getAppointmentIdentification()).get("reason"));
			ra.addFlashAttribute("intituition", appointmentService.checkAppointment(appointment.getAppointmentIdentification()).get("intituition"));
			ra.addFlashAttribute("specialty",appointmentService.checkAppointment(appointment.getAppointmentIdentification()).get("specialty"));
			ra.addFlashAttribute("doctorsname", appointmentService.checkAppointment(appointment.getAppointmentIdentification()).get("doctorsname"));
			ra.addFlashAttribute("date",  appointmentService.checkAppointment(appointment.getAppointmentIdentification()).get("date"));
			ra.addFlashAttribute("time",  appointmentService.checkAppointment(appointment.getAppointmentIdentification()).get("time"));
			ra.addFlashAttribute("address",  appointmentService.checkAppointment(appointment.getAppointmentIdentification()).get("address"));
		} else {
			ra.addFlashAttribute("identifier", 0L);
		}
		
		System.out.println("la razon es " + appointmentService.checkAppointment(appointment.getAppointmentIdentification()).get("reason"));
		System.out.println("el numero de id es  " + appointment.getAppointmentIdentification());

		return new ModelAndView("redirect:/appointmentchecking");

		
	}
	
	
	//Put requests ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	@PutMapping("/schedule-appointment")
	public ResponseEntity scheduleAppointment(@RequestBody MultiValueMap<String,String> paramMap){
		System.out.println("estamoss bro");
		AppointmentsServices appointmentService = new AppointmentsServices();
		String res = appointmentService.scheduleAppointment(paramMap.get("firstName").get(0), paramMap.get("lastName").get(0), paramMap.get("secondLastName").get(0),paramMap.get("reason").get(0), paramMap.get("specialty").get(0));
		
		Long appid = appointmentService.checkAppointmentNameBased(paramMap.get("firstName").get(0), paramMap.get("lastName").get(0), paramMap.get("secondLastName").get(0));
		
		
		HttpStatus ht = null;
		if (res == "saved") {
			ht = HttpStatus.OK;
		} else {
			ht = HttpStatus.BAD_REQUEST;
		}
		
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.set("appid", String.valueOf(appid));

		return ResponseEntity.status(ht).headers(responseHeaders).build();
	}
	

	
	//Delete requests ----------------------------------------------------------------------------------------------------------------------------------------------------------------

	
	@DeleteMapping("/delete-appointment")
	public ModelAndView deleteAppointment(@ModelAttribute("appointment") Appointment appointment, RedirectAttributes ra) {
		String page = "";
		AppointmentsServices appointmentService = new AppointmentsServices();
		
		String identification = String.valueOf(appointment.getAppointmentIdentification());
		if (appointmentService.deleteAppointment(identification) > 0) {
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
