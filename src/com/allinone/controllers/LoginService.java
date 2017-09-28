package com.allinone.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginService {
@RequestMapping(value="/login")
@ResponseBody
public String loginrequest( @RequestParam String name, @RequestParam String password) {
	return "Welcome";
}
}
