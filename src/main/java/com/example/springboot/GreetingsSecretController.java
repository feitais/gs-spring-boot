package com.example.springboot;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingsSecretController {
    @Value("${sm://gs-secret-test}")
    String secret;

}
