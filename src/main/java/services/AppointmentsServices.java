package services;

import java.util.Map;

import dao.Dao;

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


	public int updateAppointment(String identifier, String reason, String specaialty) {
		Long idLong = Long.parseLong(identifier);
		Dao dao =  new Dao();
		return dao.updateAppointment(idLong, reason, specaialty);
	}


}
