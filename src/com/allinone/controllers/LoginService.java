package com.allinone.controllers;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.hql.internal.ast.tree.IsNullLogicOperatorNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allinone.pojos.User;
import com.allinone.service.api.UserRegistrationServiceAPI;


@Controller
public class LoginService {

	@Autowired
	UserRegistrationServiceAPI objUserRegistrationService;

	@RequestMapping(value = "/login")
	public String loginrequest(HttpServletRequest objRequest, ModelMap model) {
		String userName = objRequest.getParameter("username");
		String password = objRequest.getParameter("password");

		// UserRegistrationServiceAPI objServiceAPI = new UserRegistrationServiceImpl();
		User temp = objUserRegistrationService.checkUserLogin(userName, password);
		if (temp!= null) {
		model.put("name", temp.getUserName());
		model.put("emailId", temp.getEmailAddress());
		model.put("userId", temp.getUserId());
		//System.out.println(temp.getEmailAddress()+"EmailID of user");
		if(temp.getFirstName() != null)
		{
			
			model.put("firstName",temp.getFirstName());
		}
		else {
			model.put("firstName","First Name");
		}
		
		if(temp.getLastName()  != null)
		{
			model.put("lastName",temp.getLastName());
			
		}
		else {
			model.put("lastName","Last Name");
		}
		if(temp.getPhoneNumber() != null)
		{
			model.put("phoneNumber",temp.getPhoneNumber());
		}
		else {
			
			model.put("phoneNumber","Phone Number");
		}
		
		//model.put("phone", temp.getPhoneNumber());
		return "UserDashboard";
		}
		return "redirect:" + "http://localhost:8080/All-In-One-FantasyGame/LandingPage1.jsp";
	}


	@RequestMapping(value = "/loginCheck")
	@ResponseBody
	public String loginCheck(HttpServletRequest objRequest, ModelMap model) {
		String userName = objRequest.getParameter("username");
		String password = objRequest.getParameter("password");

		// UserRegistrationServiceAPI objServiceAPI = new UserRegistrationServiceImpl();
		User temp = objUserRegistrationService.checkUserLogin(userName, password);
		if (temp!= null) {return "true";}
		return "false";
	}

	@RequestMapping(value = "/redirectToHomePage")
	public String redirectToHomePage(HttpServletRequest objRequest, ModelMap model) {
		String userId = objRequest.getParameter("userId");
		User temp = objUserRegistrationService.pullUser(userId);
		if (temp!= null) {
		model.put("name", temp.getUserName());
		model.put("emailId", temp.getEmailAddress());
		model.put("userId", temp.getUserId());
		//System.out.println(temp.getEmailAddress()+"EmailID of user");
		if(temp.getFirstName() != null)
		{
			
			model.put("firstName",temp.getFirstName());
		}
		else {
			model.put("firstName","First Name");
		}
		
		if(temp.getLastName()  != null)
		{
			model.put("lastName",temp.getLastName());
			
		}
		else {
			model.put("lastName","Last Name");
		}
		if(temp.getPhoneNumber() != null)
		{
			model.put("phoneNumber",temp.getPhoneNumber());
		}
		else {
			
			model.put("phoneNumber","Phone Number");
		}
		
		//model.put("phone", temp.getPhoneNumber());
		return "UserDashboard";
	}
		return "redirect:" + "http://localhost:8080/All-In-One-FantasyGame/LandingPage1.jsp";
		}
	
	
}
