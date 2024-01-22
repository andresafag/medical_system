package models;

import org.springframework.stereotype.Component;

@Component
public class BindingClass {

	private String reason;
	private String firstName;
	private String lastName;
	private String secondLastName;
	private String specialty;

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	

	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getSecondLastName() {
		return secondLastName;
	}


	public void setSecondLastName(String secondLastName) {
		this.secondLastName = secondLastName;
	}


	public String getSpecialty() {
		return specialty;
	}


	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	
	
	
}
