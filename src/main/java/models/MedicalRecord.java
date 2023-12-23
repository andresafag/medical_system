package models;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class MedicalRecord {
	@Id
	@GeneratedValue
	private int id;
	private Date date;
	
	
	
	
	
}
