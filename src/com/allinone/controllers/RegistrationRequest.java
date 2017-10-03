package com.allinone.controllers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allinone.service.api.UserRegistrationServiceAPI;
import com.allinone.service.impl.UserRegistrationServiceImpl;

@Controller("All-In-One-FantasyGame")
public class RegistrationRequest {
	
	@Autowired
	UserRegistrationServiceAPI objUserRegistrationService;
	
	
	@RequestMapping(value="/register")
	@ResponseBody
	public String registerrequest(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String userName = objRequest.getParameter("username");
		String password = objRequest.getParameter("password");
		String emailAddress = objRequest.getParameter("email");
		String phoneNumber = objRequest.getParameter("phoneNumber");
		
		//UserRegistrationServiceAPI objServiceAPI = new UserRegistrationServiceImpl();
		String returnMessage = objUserRegistrationService.addUser(userName, password, emailAddress, phoneNumber)?"Registration successful":"Failed";
		
		return returnMessage;
	}
}
//http://localhost:8080/All-In-One-FantasyGame/UIAssests/CricketImage1.jpg