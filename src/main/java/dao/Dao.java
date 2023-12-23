package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import io.micrometer.observation.Observation.Event;

@Repository
public class Dao {
	
	public static void main(String[] args) {
		Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
		System.out.println("listo");
		 // A SessionFactory is set up once for an application!
	    final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().build();     
	   
	  //creating seession factory object    
	  		SessionFactory factory=cfg.buildSessionFactory();    
	  		    
	  		//creating session object    
	  		Session session=factory.openSession();    
	  		    
	  	
	  		session.close();  
	}
	
	
	public boolean appointmentById(int id){
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
		  		Query query = session.createQuery("FROM Appointment P WHERE P.id=:id");
		  		query.setParameter("id", id);
		  		
		  		
		  		return query.getResultList().isEmpty();
	  		    
	 		
	}
	
	
	
}
