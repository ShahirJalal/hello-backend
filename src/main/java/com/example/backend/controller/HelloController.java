package com.example.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*") // Allow requests from any origin for this simple example
public class HelloController {

    @GetMapping("/api/hello")
    public String sayHello() {
        return "Hello World";
    }
}