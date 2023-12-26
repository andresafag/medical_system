package dao;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import interfaces.AppoinmentsInter;
import interfaces.LabsInter;
import models.Appointment;
import models.Patient;

@Repository
public class Dao implements AppoinmentsInter, LabsInter{

	
	public Map<String,Object> appointmentById(Long id){
	  			Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
	  			System.out.println("listo");
	  			 // A SessionFactory is set up once for an application!
	  		    final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().build();     
	  		   
	  		  //creating seession factory object    
	  		    SessionFactory factory=cfg.buildSessionFactory();    
	  		  		    
	  		  		//creating session object    
	  		    Session session=factory.openSession();    
//	  		    Transaction tx = session.beginTransaction();
	  		  		
	  		    
	  		    @SuppressWarnings("deprecation")
		  		Query query = session.createQuery("FROM Appointment P WHERE P.appointmentIdentification=:id");
		  		query.setParameter("id", id);
		  		
		  		 HashMap<String, Object> appointmentData = new HashMap<String, Object>();
		  		
		  		if (!query.list().isEmpty()) {
		  			Appointment appointment = new Appointment();
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
		  		
		  		return appointmentData;
	  		    
	 		
	}

	@Override
	public boolean scheduleAppointment() {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
	
	

	@Override
	public Map<String,Object> checkLabs(String name) {
		// TODO Auto-generated method stub
		Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
		System.out.println("listo");
		 // A SessionFactory is set up once for an application!
	    final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().build();     
	   
	  //creating seession factory object    
	    SessionFactory factory=cfg.buildSessionFactory();    
	  		 
	    //creating session object    
	    Session session=factory.openSession();    
	  	
	  		
//	  		
	    @SuppressWarnings("deprecation")
	    Query query = session.createQuery("FROM Patient P INNER JOIN P.labs c WHERE firstName=:name");
	    query.setParameter("name", name);

	    
	    
	    HashMap<String, Object> labsData = new HashMap<String, Object>();
  		
  		if (!query.list().isEmpty()) {
  			Patient patient = new Patient();
  			patient = (Patient) query.uniqueResult();
	  		
	  		System.out.println(patient.getLabs().size());
	  		
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

	@Override
	public int deleteAppointment(Long id) {
		int result = 0;
		Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
			System.out.println("listo");
			 // A SessionFactory is set up once for an application!
			SessionFactory factory = new Configuration().configure().buildSessionFactory();     
		     
		  		    
		  		//creating session object    
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
	
	

	@Override
	public int updateAppointment(Long id, String reason, String specialty) {
		System.out.println("el id es " + id);
		System.out.println(reason);
		System.out.println(specialty);
		
		int result = 0;
		Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
			System.out.println("listo");
			 // A SessionFactory is set up once for an application!
			SessionFactory factory = new Configuration().configure().buildSessionFactory();     
		     
		  		    
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
		return result;
	}
	
	
	
}
