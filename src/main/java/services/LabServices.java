package services;

import java.util.Map;

import org.springframework.stereotype.Service;

import dao.Dao;


@Service
public class LabServices {
	
	public Map<String,Object> checkLabResults(String name, String lastName, String secondLastName) {
		Dao dao =  new Dao();
		return dao.checkLabs(name, lastName, secondLastName);
	}
}
