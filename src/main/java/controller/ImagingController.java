package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import models.Patient;
import services.AppointmentsServices;
import services.ImagingServices;


@Controller
public class ImagingController {

	
	@GetMapping("/ImagingList")
	public String imaginglist(Model model) {
		System.out.println(model.getAttribute("imagingNumber"));
		return "imaginglist";
	}
	
	
	
	
	@PostMapping("/checkImaging")
	public ModelAndView checkImaging(@RequestParam("name") String name, @RequestParam("lastName") String lastName, @RequestParam("secondLastName") String secondLastName, RedirectAttributes ra) {
		ImagingServices imgser = new ImagingServices();
		int imagingInteger = imgser.getPatientId(name, lastName, secondLastName);
		ra.addFlashAttribute("imagingNumber", imagingInteger);
		return new ModelAndView("redirect:/ImagingList") ;

	}
	
	
	
//	@PostMapping("/testingpost")
//	public void testingpost(@ModelAttribute("paciente") Patient pat) {
//		System.out.println(pat.getFirstName());
//		System.out.println("passed");
//	}
	
	
}
