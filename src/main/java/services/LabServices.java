package services;

import java.util.Map;
import dao.Dao;

public class LabServices {
	
	public Map<String,Object> checkLabResults(String name) {
		Dao dao =  new Dao();
		return dao.checkLabs(name);
	}
}
