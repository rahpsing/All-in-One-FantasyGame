package com.allinone.controllers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("All-In-One-FantasyGame")
public class RegistrationRequest {
	@RequestMapping(value="/register")
	@ResponseBody
	public String registerrequest(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		return "Registration successful";
	}
}
//http://localhost:8080/All-In-One-FantasyGame/UIAssests/CricketImage1.jpg