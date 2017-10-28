package com.allinone.controllers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allinone.service.api.SportUtilityServiceAPI;

@Controller
public class UploadController {
	
	@Autowired
	SportUtilityServiceAPI objSportUtility;
	
	
	@RequestMapping(value="/upload")
	@ResponseBody
	public String uploadUserData(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String returnMessage = objSportUtility.readEntriesToDatabase()?"Success":"Failed";
		
		
		return returnMessage;
	}
	
	@RequestMapping(value="/addNewSport")
	@ResponseBody
	public String addNewSport(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String returnMessage = objSportUtility.addNewSport()?"Success":"Failed";
		
		
		return returnMessage;
	}
	
	
	@RequestMapping(value="/initialize")
	@ResponseBody
	public String initializeSystem(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String returnMessage = "";
		//String returnMessage = objSportUtility.addNewSport()?"Success":"Failed";
		//String returnMessage2 = objSportUtility.createLeague()?"Success":"Failed";
		
		if(objSportUtility.addNewSport() && objSportUtility.createLeague())
			returnMessage = "Success";
		
		
		return returnMessage;
	}
	

}
