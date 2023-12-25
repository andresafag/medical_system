package models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "prescriptionpills")
public class PrescriptionPills {
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String doses;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDoses() {
		return doses;
	}
	public void setDoses(String doses) {
		this.doses = doses;
	}
	
	
	
	
}
