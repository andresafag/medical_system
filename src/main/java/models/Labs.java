package models;

import java.sql.Date;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "labs")
public class Labs {
	@Id
	@GeneratedValue
	private int id;
	private long labIdentification;
	private String nameOfTheLab;
	private Date date;
	private String time;
	private String address;
	private String  intitution;
	@ManyToOne
	private Patient patient;
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public long getLabIdentification() {
		return labIdentification;
	}
	public void setLabIdentification(long labIdentification) {
		this.labIdentification = labIdentification;
	}
	public String getNameOfTheLab() {
		return nameOfTheLab;
	}
	public void setNameOfTheLab(String nameOfTheLab) {
		this.nameOfTheLab = nameOfTheLab;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getIntitution() {
		return intitution;
	}
	public void setIntitution(String intitution) {
		this.intitution = intitution;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	
	
	
	
	
}
