package services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import org.springframework.stereotype.Service;
import com.mysql.cj.exceptions.CJTimeoutException;

import interfaces.RandomDataGenerator;


@Service
public class RandomData implements RandomDataGenerator{

	@Override
	public String generateRandomDate() {

		Date date =  new Date();
		Random ram = new Random();
		String newDateString= null;
		
		Calendar monthStart = new GregorianCalendar((date.getYear()+1900), 4, 1);
		monthStart.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		int randomDay = ram.nextInt(date.getDate()+1,monthStart.getActualMaximum(Calendar.DAY_OF_MONTH));
		String dayString = String.valueOf(randomDay);
		
		String monthString = String.valueOf(date.getMonth()+1);
		String yearString = String.valueOf((date.getYear()+1900));
		

		
		String RandomDate = String.format("%s/%s/%s ", monthString,dayString,yearString);
		
		  
 		try {
  			
  			String OLD_FORMAT = "MM/dd/yyyy";
  			String NEW_FORMAT = "yyyy-MM-dd";

  			String oldDateString = RandomDate;
//  			String newDateString;

  			SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
  			java.util.Date d = (java.util.Date) sdf.parse(oldDateString);
  			sdf.applyPattern(NEW_FORMAT);
  			newDateString = sdf.format(d);
  			
//  			dateOfAppointment = java.sql.Date.valueOf(newDateString);
  	
		} catch (CJTimeoutException | ParseException e) {
			// TODO: handle exception
		}
 		
		return newDateString;
	}
	
	
	
	
	
	

	@Override
	public String getCurrentDate() {
		// TODO Auto-generated method stub
		
		return null;
	}







	@Override
	public Long getRandomIdentifier() {
		// TODO Auto-generated method stub
		Random ram = new Random();
		return ram.nextLong(1111111111L, 99999999999999999L);
	}







	
}
