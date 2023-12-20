package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


//@WebServlet("/benefits")
//public class Benefits extends HttpServlet{
//	
//	 /**
//	 * 
//	 */
//	private static final long serialVersionUID = 1L;
//	
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		  resp.setContentType("text/html");
////		  PrintWriter printWriter = resp.getWriter();
////		  printWriter.print("<html>");
////		  printWriter.print("<body>");
////		  printWriter.print("<h1>Hello World HttpServlet Class Example</h1>");
////		  printWriter.print("<a href=\"http://www.javaguides.net\">Java Guides</a>");
////		  printWriter.print("</body>");
////		  printWriter.print("</html>");
////		  printWriter.close();
//		  resp.sendRedirect("benefits.html");
//	    }
//
//	
//}

@Controller
public class MainController {
	

	@GetMapping("/")
	public String home() {
		System.out.println("hola carnales");
		return "home";
	}
	
	@GetMapping("/benefits")
	public String benefits() {
		return "benefits";
	}
	
	@GetMapping("/inde")
	public String inde() {
		return "inde";
	}

}



