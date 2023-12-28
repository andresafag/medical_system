package interfaces;

import java.util.Map;

public interface AppoinmentsInter {

	public  Map<String,Object> appointmentById(Long id);
	
	public String scheduleAppointment(String firstName,String lastName, String secondLastName,  String reason, String specialty);

	public int  deleteAppointment(Long id);
	
	public int updateAppointment(Long id, String reason, String specialty);
}
