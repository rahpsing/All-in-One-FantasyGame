package com.allinone.controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
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
		model.put("emailID", temp.getEmailAddress());
		//model.put("phone", temp.getPhoneNumber());
		return "UserDashboard";
		}
		return "redirect:" + "http://localhost:8080/All-In-One-FantasyGame/LandingPage1.jsp";
	}

}
