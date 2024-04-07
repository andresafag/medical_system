package models;

import java.sql.Date;
import java.util.List;
import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Positive;

@Component
@Entity
@Table(name = "patient")
public class Patient   {
	@Id
	@GeneratedValue
	private int id;
	@NotNull
	@Length(min = 2, max = 20)
	private String firstName;
	@NotNull
	@Length(min = 2, max = 20)
	private String secondName;
	@NotNull
	@Length(min = 2, max = 20)
	private String firstLastName;
	@NotNull
	@Length(min = 2, max = 20)
	private String secondLastName;
	@NotNull
	@Digits(integer=3, fraction=0)
	@Positive
	@DecimalMin(value = "1", inclusive = true)
	private int age;
	@NotNull
	@Length(min=1, max=1)
	private String gender;
	@NotNull
	@Length(min = 4, max = 40)
	private String address;
	@NotNull
	@Digits(integer=13, fraction=0)
	@Positive
	@DecimalMin(value = "1", inclusive = true)
	private long phoneNumber;
	@NotNull
	@Past(message = "not a date")
	private Date dateOfBirth;
	
	@OneToMany(mappedBy = "patient")
	private List<Labs> labs;
	
	@OneToMany
	@JoinColumn(name="appointmentpatientrelation")
	private List<Appointment> appointments;
	

	public Patient() {
		
	}

	public Patient(int id) {
		this.id=id;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getSecondName() {
		return secondName;
	}
	public void setSecondName(String secondName) {
		this.secondName = secondName;
	}
	
	public String getFirstLastName() {
		return firstLastName;
	}
	public void setFirstLastName(String firstLastName) {
		this.firstLastName = firstLastName;
	}
	public String getSecondLastName() {
		return secondLastName;
	}
	public void setSecondLastName(String secondLastName) {
		this.secondLastName = secondLastName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public List<Appointment> getAppointments() {
		return appointments;
	}
	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	public List<Labs> getLabs() {
		return labs;
	}

	public void setLabs(List<Labs> labs) {
		this.labs = labs;
	}
	
	

}
