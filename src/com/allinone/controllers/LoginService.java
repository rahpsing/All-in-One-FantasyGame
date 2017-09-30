package com.allinone.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginService {
	@RequestMapping(value = "/login")
	@ResponseBody
	public String loginrequest(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		return "Welcome";
	}
}
