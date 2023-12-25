package interfaces;

import java.util.Map;

public interface AppoinmentsInter {

	public  Map<String,Object> appointmentById(Long id);
	
	public boolean scheduleAppointment();
}
