package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.validation.Valid;
import models.Patient;
import services.PatientServices;

@Controller
public class PatientController {
	
	
	@PostMapping("/registration")
	public  ModelAndView patientRegistration(@Valid @ModelAttribute("patient") Patient patient, RedirectAttributes ra)  {
	
		PatientServices patientServices  = new PatientServices();
		patientServices.savePatient(patient.getFirstName(), patient.getSecondName(), patient.getFirstLastName(), patient.getSecondLastName(), patient.getAge(), patient.getDateOfBirth(), patient.getGender(), patient.getAddress(), patient.getPhoneNumber());

		return  new ModelAndView("redirect:/");
	}
	
	
	
	
	

	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ModelAndView handleValidationExceptions(
	  MethodArgumentNotValidException ex, RedirectAttributes ra) {
	    Map<String, String> errors = new HashMap<>();
	    ex.getBindingResult().getAllErrors().forEach((error) -> {
	        String fieldName = ((FieldError) error).getField();
	        String errorMessage = error.getDefaultMessage();
	        errors.put(fieldName, errorMessage);
	    });
	    for (String element : errors.keySet()) {
			System.out.println(element);
		}
	    
	    
	    
	    ra.addFlashAttribute("invalidFields", errors);
;
		return  new ModelAndView("redirect:/errorpatienthandler");

	}
	
	
}
