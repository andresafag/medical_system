package models;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
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
	@ElementCollection
	private Map<String, String> results = new HashMap<String,String>();
	
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
	public Map<String, String> getResults() {
		return results;
	}
	public void setResults(Map<String, String> results) {
		this.results = results;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
	
	
	
}
