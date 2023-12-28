package services;

import java.util.Map;

import org.springframework.stereotype.Service;

import dao.Dao;


@Service
public class LabServices {
	
	public Map<String,Object> checkLabResults(String name) {
		Dao dao =  new Dao();
		return dao.checkLabs(name);
	}
}
