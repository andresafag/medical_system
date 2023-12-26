package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	
	
}
