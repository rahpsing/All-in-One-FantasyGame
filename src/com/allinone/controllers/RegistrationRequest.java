package com.allinone.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RegistrationRequest {
	@RequestMapping(value="/register",method=RequestMethod.POST)
	@ResponseBody
	public String registerrequest( @RequestParam String name, @RequestParam String password,@RequestParam String email) {
		return "Registration successful";
	}
}
