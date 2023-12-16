package otherpackage;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import mainpackage.TestApp;


@ComponentScan(basePackages = "mainpackage")
@Configuration
public class AppConfig {
	
	 public static void main(String[] args) {
	        var ctx = new AnnotationConfigApplicationContext(AppConfig.class);
	        var timeService = (TestApp) ctx.getBean(TestApp.class);
	        System.out.println(timeService.getDate());
	        ctx.close();
	    }
	 
}
