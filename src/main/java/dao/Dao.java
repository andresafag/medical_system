package dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import interfaces.AppoinmentsInter;
import interfaces.ImagingInter;
import interfaces.LabsInter;
import interfaces.PatientTransactions;
import models.Appointment;
import models.Labs;
import models.Patient;
//import models.Patient_labs;
import services.RandomData;


@Repository
public class Dao implements AppoinmentsInter, LabsInter, PatientTransactions, ImagingInter{
	

	@Autowired
	private Patient patient;
	@Autowired
	private Appointment appointment;
	private RandomData randomData = new RandomData();
	private final Configuration cfg = new Configuration().configure();
	private final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().build(); 
	private final SessionFactory factory=cfg.buildSessionFactory();  
	
	
	public Long appointmentByName(String firstName, String lastName, String secondSurname){
		Session session=factory.openSession();    
		
		try {
		    @SuppressWarnings("deprecation")
	  		Query query = session.createQuery("FROM Appointment P INNER JOIN P.patient WHERE patient.firstName=:name AND patient.firstLastName=:firstSurname AND patient.secondLastName=:secondSurname");
			query.setParameter("name", firstName);    
			query.setParameter("firstSurname", lastName);    
			query.setParameter("secondSurname", secondSurname);
			
			appointment = (Appointment) query.list().get(query.list().size()-1);
			
			System.out.println(appointment.getAppointmentIdentification());
			
			session.close();

		} catch (Throwable t) {
		  throw t;
		}
		return appointment.getAppointmentIdentification();
	}
	

	
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	public Map<String,Object> appointmentById(Long id){
	  		    Session session=factory.openSession();    
	  		    
	  		    @SuppressWarnings("deprecation")
		  		Query query = session.createQuery("FROM Appointment P WHERE P.appointmentIdentification=:id");
		  		query.setParameter("id", id);
		  		
		  		 HashMap<String, Object> appointmentData = new HashMap<String, Object>();
		  		
		  		if (!query.list().isEmpty()) {
			  		appointment = (Appointment) query.uniqueResult();
			  		
			        appointmentData.put("appointmentIdentification", appointment.getAppointmentIdentification());
			        appointmentData.put("reason", appointment.getReason());
			        appointmentData.put("intituition", appointment.getInstitution());
			        appointmentData.put("specialty", appointment.getSpecialty());
			        appointmentData.put("doctorsname", appointment.getDoctorName());
			        appointmentData.put("date", appointment.getAppointmentDate());
			        appointmentData.put("time", appointment.getTime());
			        appointmentData.put("address", appointment.getAddress());
				} 
		  		
		  		session.close();
		  		return appointmentData;
	}
	
	
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------

	@Override
	public String scheduleAppointment(String firstName,String lastName, String secondLastName,  String reason, String specialty) {
		String result;
		
		    Session session=factory.openSession();    
		    Transaction tx = session.beginTransaction();
		    System.out.println("desde el backend " + firstName + " " + lastName);
		   
		    @SuppressWarnings("deprecation")
		    Query queryPatient = session.createQuery("FROM Patient P WHERE P.firstName=lower(:fn) AND P.firstLastName=lower(:fl) AND P.secondLastName=:sl");
		    queryPatient.setParameter("fn", firstName);
		    queryPatient.setParameter("fl", lastName);
		    queryPatient.setParameter("sl", secondLastName);
		    
		    if (queryPatient.list().isEmpty()) {
				System.out.println("agreguemos al paciente a la base de datos primero");
				result = "no patient";
				
			} else {
				
			    @SuppressWarnings("deprecation")
			    Query querySpecialtyOnSpecificDate = session.createQuery("FROM Appointment A WHERE A.appointmentDate=:date AND A.specialty=lower(:specialty)");
			    querySpecialtyOnSpecificDate.setParameter("date", Date.valueOf(randomData.generateRandomDate())); 
			    querySpecialtyOnSpecificDate.setParameter("specialty", specialty);


			    int appointmentChecking =  querySpecialtyOnSpecificDate.getResultList().size();
			    System.out.println(appointmentChecking > 0);
			    
			    
			    
			    switch (appointmentChecking) {
				case 0:
				case 1:
				case 2:
				case 3:
				case 4:
					System.out.println("no existe cita alguna para esa fecha");
					List<Appointment> appo = new ArrayList<Appointment>();
				    appointment = new Appointment();
				    appointment.setAppointmentIdentification(randomData.getRandomIdentifier());
				    appointment.setReason(reason);
				    appointment.setInstitution("nuevo horizonte");
				    appointment.setSpecialty(specialty);
				    appointment.setDoctorName("Jaime Rodriguez");
				    appointment.setAppointmentDate(Date.valueOf(randomData.generateRandomDate()));
				    appointment.setTime("10:09");
				    appointment.setAddress("calle 84 # 12 - 14");
				    appo.add(appointment);
				    patient = (Patient) queryPatient.uniqueResult();
				    patient.setAppointments(appo);
				    appointment.setPatient(patient);
				    int res = (int) session.save(appointment);
				    result = (res == 0) ? "not saved" : "saved";
				    System.out.println("el resultado " + res);
				    tx.commit();
					break;
				default:
					result = "too many appointments";
					break;
				}
 
			    
			}
	    
		    session.close();
  		
		return result;
	}
	
	
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------
	

	@Override
	public Map<String,Object> checkLabs(String name, String lastName, String secondLastName) {  
	    Session session=factory.openSession();    
  		
	    @SuppressWarnings("deprecation")
	    Query query = session.createQuery("FROM Patient P INNER JOIN P.labs c WHERE firstName=lower(:name) AND firstLastName=lower(:lastName) AND secondLastName=lower(:secondLastName)");
	    query.setParameter("name", name);
	    query.setParameter("lastName", lastName);
	    query.setParameter("secondLastName", secondLastName);

	    
	    
	    HashMap<String, Object> labsData = new HashMap<String, Object>();
  		
  		if (!query.list().isEmpty()) {
  			patient = (Patient) query.uniqueResult();		
	  		
	  		int labIndex = patient.getLabs().size() - 1;
	  		
	  		labsData.put("identification", patient.getLabs().get(labIndex).getLabIdentification());
	        labsData.put("labname",  patient.getLabs().get(labIndex).getNameOfTheLab());
	        labsData.put("labintituition",  patient.getLabs().get(labIndex).getIntitution());
	        labsData.put("address",  patient.getLabs().get(labIndex).getAddress());
	        labsData.put("date",  patient.getLabs().get(labIndex).getDate());
	        labsData.put("time",  patient.getLabs().get(labIndex).getTime());
      
		} 
  		
  		session.close();  
  		
  		return labsData;
	  
	}
	
	
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------

	@Override
	public int deleteAppointment(Long id) {
		int result = 0;
		Session session=factory.openSession();    
		Transaction tx = session.beginTransaction();
	
  		
  		try {
  		  // your code
  		  String hql = "DELETE FROM Appointment P WHERE P.appointmentIdentification=:id";
  		  Query query = session.createQuery(hql);
  		  query.setParameter("id", id);
  		  result = query.executeUpdate();
  		  

  		  tx.commit();
  		} catch (Throwable t) {
  		  tx.rollback();
  		  throw t;
  		}
  		
		return result;
	}
	
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------

	@Override
	public int updateAppointment(Long id, String reason, String specialty) {
		int result = 0;
		  		//creating session object    
		Session session=factory.openSession();    
		Transaction tx = session.beginTransaction();
		try {
	  		  // your code
	  		  String hql = "UPDATE Appointment SET reason=:reason, specialty=:specialty WHERE appointmentIdentification=:identifier";
	  		  Query query = session.createQuery(hql);
	  		  query.setParameter("identifier", id);
	  		  query.setParameter("reason", reason);
	  		  query.setParameter("specialty", specialty);
	  		  result = query.executeUpdate();
	  		  

	  		  tx.commit();
	  		} catch (Throwable t) {
	  		  tx.rollback();
	  		  throw t;
	  		}
		
		session.close();
		return result;
	}

	@Override	
	public int createPatient(String firstName,String secondName, String firstLastName, String secondLastName, String age, String dateOfBirth, String gender, String address,String phoneNumber) {

		
		int result = 0;
  		//creating session object    
		Session session=factory.openSession();    
		Transaction tx = session.beginTransaction();
		 
		try {
		  patient =  new Patient();
		  patient.setFirstName(firstName);
		  patient.setSecondName(secondName);
		  patient.setFirstLastName(firstLastName);
		  patient.setSecondLastName(secondLastName);
		  patient.setAge(Integer.parseInt(age));
		  patient.setDateOfBirth(Date.valueOf(dateOfBirth));
		  patient.setGender(gender);
		  patient.setAddress(address);
		  patient.setPhoneNumber(Long.parseLong(phoneNumber));
		  result = (int) session.save(patient);

		  tx.commit();
		} catch (Throwable t) {
		  tx.rollback();
		  throw t;
		}

		session.close();
		
		return result;
	}


	@Override
	public boolean doesPatientExist(String firstName,String secondName, String firstLastName, String secondLastName, String age, String dateOfBirth) {
		boolean result = false;
  		//creating session object    
		Session session=factory.openSession();    
		
		try {
		  // your code
		  String hql = "FROM Patient P WHERE firstName=:fn AND secondName=:sn AND firstLastName =:fln AND secondLastName=:sln AND age=:age AND dateOfBirth=:dob";
		  Query queryPatient = session.createQuery(hql);
		  queryPatient.setParameter("fn", firstName);
		  queryPatient.setParameter("sn", secondName);
		  queryPatient.setParameter("fln", firstLastName);
		  queryPatient.setParameter("sln", secondLastName);
		  queryPatient.setParameter("age", Integer.parseInt(age));
		  queryPatient.setParameter("dob", Date.valueOf(dateOfBirth));
		  
		  result = !queryPatient.list().isEmpty();

		} catch (Throwable t) {
		  throw t;
		}

		session.close();
		
		return result;
	}

	@Override
	public int getPatientId(String name, String lastName, String secondLastName) {
		int result = 0;
		Session session=factory.openSession();    

		  String hql = "FROM Patient P WHERE firstName=:fn AND firstLastName =:fln AND secondLastName=:sln";
		  Query queryPatient = session.createQuery(hql);
		  queryPatient.setParameter("fn", name);
		  queryPatient.setParameter("fln", lastName);
		  queryPatient.setParameter("sln", secondLastName);
		  
		  if (queryPatient.list().isEmpty() == false) {
			  patient = (Patient) queryPatient.uniqueResult();
			  System.out.println("lo que retorna " + patient.getId());
			  result = patient.getId();
		  } 

		session.close();
		return result;
		
	}
		
}
