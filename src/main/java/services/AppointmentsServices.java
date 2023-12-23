package services;

import dao.Dao;

public class AppointmentsServices {
	
	public boolean checkAppointment(String id) {
		int idInt = Integer.parseInt(id);
		Dao dao =  new Dao();
		return dao.appointmentById(idInt);
	}
}
