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

@Controller
public class LoginService {
	
	@Autowired
	UserRegistrationServiceAPI objUserRegistrationService;
	
	@RequestMapping(value = "/login")
	@ResponseBody
	public String loginrequest(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		String userName = objRequest.getParameter("username");
		String password = objRequest.getParameter("password");

		
		//UserRegistrationServiceAPI objServiceAPI = new UserRegistrationServiceImpl();
		String returnMessage = objUserRegistrationService.checkUserLogin(userName, password)?"Login successful":"Failed";
		
		return returnMessage;
	}
}
