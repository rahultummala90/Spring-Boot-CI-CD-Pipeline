package io.navitas.hello;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/navitas")
public class HelloController {
	
	@GetMapping
	public String sayHi() {
		return "Hello Navitas Tech";
	}

}
