package com.allinone.controllers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allinone.pojos.User;
import com.allinone.service.api.UserRegistrationServiceAPI;
import com.allinone.service.impl.UserRegistrationServiceImpl;

@Controller("All-In-One-FantasyGame")
public class RegistrationRequest {
	
	@Autowired
	UserRegistrationServiceAPI objUserRegistrationService;
	
	
	@RequestMapping(value="/register")
	@ResponseBody
	public String registerrequest(HttpServletRequest objRequest, HttpServletResponse objResponse,ModelMap model) {
		
		String userName = objRequest.getParameter("userName");
		String password = objRequest.getParameter("passWord");
		String emailAddress = objRequest.getParameter("emailId");
		String phoneNumber = objRequest.getParameter("phoneNumber");
		String firstName = objRequest.getParameter("firstName");
		String lastName = objRequest.getParameter("lastName");
		//UserRegistrationServiceAPI objServiceAPI = new UserRegistrationServiceImpl();
		String returnMessage = objUserRegistrationService.addUser(userName, password, emailAddress, phoneNumber,firstName,lastName);	
				
		return returnMessage;
		
		
	}
	
	@RequestMapping(value="/updateUser")
	@ResponseBody
	public String updateUserRequest(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		String userId = objRequest.getParameter("userId");
		//String password = objRequest.getParameter("password");
		String emailAddress = objRequest.getParameter("email");
		String phoneNumber = objRequest.getParameter("phoneNumber");
		String firstName = objRequest.getParameter("firstName");
		String lastName = objRequest.getParameter("lastName");
		
		return objUserRegistrationService.updateUser(userId, emailAddress, phoneNumber,firstName,lastName);
	}
}
//http://localhost:8080/All-In-One-FantasyGame/UIAssests/CricketImage1.jpg