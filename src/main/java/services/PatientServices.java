package services;

import java.util.Date;
import dao.Dao;

public class PatientServices {
	
	
	
	public int savePatient(String firstName, String middleName, String surname, String secondSurname, int age, Date dob, String gender, String address, Long phoneNumber) {
		Dao dao = new Dao();
		String ageString = String.valueOf(age);
		String phoneNumberString = String.valueOf(phoneNumber);
		String dobString = dob.toString();
		
		dao.createPatient(firstName, middleName, surname, secondSurname, ageString, dobString, gender, address, phoneNumberString);
		return 0;
		
	}
	
}
