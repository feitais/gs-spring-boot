package com.example.springboot;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingsSecretController {
    @Value("${sm://starbien-dummy-secret}")
    String secret;

    @GetMapping("/secret")
	public String secret() {
		return "The value of the secret is: " + secret;
	}
}
