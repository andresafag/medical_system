package models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Patient {
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String lastName;
	private int age;
	private String gender;
	private String address;
	private long phoneNumber;
	private MedicalRecord medicalRecord;
	
	
	
	
}
