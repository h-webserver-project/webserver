package webserverproject.serverproject.controllerTest;

import org.aspectj.weaver.ast.Test;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class RestControllerTest {
	@GetMapping("/get")
	public ResponseEntity<?> get(){
		

		TestDTO t = new TestDTO(25);
		return ResponseEntity.ok().body(t);
	}


}
