package interfaces;

import java.util.Map;

public interface AppoinmentsInter {

	public  Map<String,Object> appointmentById(Long id);
	
	public boolean scheduleAppointment();

	public int  deleteAppointment(Long id);
	
	public int updateAppointment(Long id, String reason, String specialty);
}
