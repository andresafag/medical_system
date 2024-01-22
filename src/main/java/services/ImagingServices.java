package services;

import java.io.File;

import org.springframework.stereotype.Service;

import dao.Dao;
import interfaces.ImagingInter;

@Service
public class ImagingServices {

	
	
	public int getPatientId(String name,String lastName, String secondLastName) {
		Dao dao = new Dao();
		File folder = new File(String.format("/Users/Andres/javaProjects/Web_medical_system/webmedical/src/main/webapp/resources/imaging/%s", dao.getPatientId(name, lastName, secondLastName)));
		System.out.println("existeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee " + folder.exists());
//		 for (File file : folder.listFiles()) {
//			 System.out.println(file.getName());
//		    }
		return dao.getPatientId(name, lastName, secondLastName);
	}
	
	
}
