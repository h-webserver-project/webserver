package webserverproject.serverproject.controllerTest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControllerTest {
	@GetMapping("/sample")
	public String hello() {
		System.out.println("123");
		return "/index";
	}

}
