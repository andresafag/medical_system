package interfaces;

public interface PatientTransactions {
	public int createPatient(String firstName,String secondName, String firstLastName, String secondLastName, String age, String dateOfBirth, String gender, String address,String phoneNumber);
	
	public boolean doesPatientExist(String firstName,String secondName, String firstLastName, String secondLastName, String age, String dateOfBirth);
}


