package services;


import java.util.Map;
import org.springframework.stereotype.Service;
import dao.Dao;


@Service
public class AppointmentsServices {
		
	
	public Map<String,Object> checkAppointment(String id) {
		Long idLong = Long.parseLong(id);
		Dao dao =  new Dao();
		return dao.appointmentById(idLong);
	}
	
	public int  deleteAppointment(String id) {
		Long idLong = Long.parseLong(id);
		Dao dao =  new Dao();
		return dao.deleteAppointment(idLong);
	}


	public int updateAppointment(String identifier, String reason, String specialty) {
		Long idLong = Long.parseLong(identifier);
		Dao dao =  new Dao();
		return dao.updateAppointment(idLong, reason, specialty);
	}
	
	
	
	public String scheduleAppointment(String firstName,String lastName, String secondLastName,  String reason, String specialty) {
		Dao dao =  new Dao();
		return dao.scheduleAppointment(firstName, lastName, secondLastName, reason, specialty);
	}
	
	
	public int registerPatient(String firstName, String secondName, String lastName, String secondLastName, String age, String dateOfBirth, String gender, String address,String phoneNumber) {
		Dao dao =  new Dao();
		return dao.createPatient(firstName, secondName, lastName, secondLastName, age,dateOfBirth, gender, address, phoneNumber);
	}
	

}
