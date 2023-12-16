package mainpackage;

import java.time.LocalTime;

import org.springframework.stereotype.Service;

@Service
public class TestApp {
	
	public LocalTime getDate() {
		 var now = LocalTime.now();

	        return now;
	}
}
