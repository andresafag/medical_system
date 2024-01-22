package controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import models.Patient;
import services.LabServices;



@Controller
public class LabsController {
		
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
	public ModelAndView checkLabs(@ModelAttribute("patient") Patient patient, RedirectAttributes ra) {//@RequestBody MultiValueMap<String,String> paramMap, RedirectAttributes ra
		LabServices labService = new LabServices();
		System.out.println("nombre " + patient.getFirstName());
			Map<String, Object> mapLabItems= labService.checkLabResults(patient.getFirstName(), patient.getFirstLastName(), patient.getSecondLastName());
			
			if (mapLabItems.size() > 0) {
			ra.addFlashAttribute("identifier",mapLabItems.get("identification"));
			ra.addFlashAttribute("labname", mapLabItems.get("labname"));
			ra.addFlashAttribute("labintituition",mapLabItems.get("labintituition"));
			ra.addFlashAttribute("address", mapLabItems.get("address"));
			ra.addFlashAttribute("date", mapLabItems.get("date"));
			ra.addFlashAttribute("time", mapLabItems.get("time"));
		} else {
			ra.addFlashAttribute("identifier", 0L);
		}
		
		return new ModelAndView("redirect:/labschecking") ;
		
	}
	
	
}
