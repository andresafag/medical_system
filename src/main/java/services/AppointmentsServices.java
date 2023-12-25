package services;

import java.util.Map;

import dao.Dao;

public class AppointmentsServices {
	
	public Map<String,Object> checkAppointment(String id) {
		Long idLong = Long.parseLong(id);
		Dao dao =  new Dao();
		return dao.appointmentById(idLong);
	}
}
