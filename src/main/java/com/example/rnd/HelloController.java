package com.example.rnd;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloController {
@RequestMapping("/")
public String hello() {
 return "Hello world44444444444444444444444";
 }
 
}
