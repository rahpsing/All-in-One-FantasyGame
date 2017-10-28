package com.allinone.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.allinone.pojos.League;
import com.allinone.service.api.LeagueServiceAPI;
import com.allinone.service.api.ListToJsonTwoColumnsServiceAPI;
import com.allinone.service.api.SportUtilityServiceAPI;

@Controller
public class LeagueController {
	
	@Autowired
	SportUtilityServiceAPI objSportUtility;
	
	@Autowired
	LeagueServiceAPI objLeagueService;
	
	@Autowired
	ListToJsonTwoColumnsServiceAPI objListToJson;
	
	@RequestMapping(value="/fetchLeagues")
	@ResponseBody
	public String fetchLeagues(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		String comparator=objRequest.getParameter("VALUE");
		List<League> returnMessage = objLeagueService.fetchLeagues(objRequest.getParameter("SPORT_NAME"),comparator);
		
		
	    String jsonString = objListToJson.listToJson("League", returnMessage);
		//System.out.println(jsonString);
		return jsonString;
	}
	
	
	
	@RequestMapping(value="/redirectLeague")
	@ResponseBody
	public String redirectLeague(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		//for search functionality
		List<League> returnMessage = objLeagueService.fetchLeagues(objRequest.getParameter("redirectValue"),"searchText");
		System.out.println(objRequest.getParameter("redirectValue"));
		//System.out.println(returnMessage.size());
		
		//String jsonString = objListToJson.listToJson("League", returnMessage);
		//System.out.println(jsonString);
		//return jsonString;
		return objRequest.getParameter("redirectValue")+"This is from backend";
	}
	
	
	@RequestMapping(value="/createLeague")
	@ResponseBody
	public String createLeague(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String returnMessage = objSportUtility.createLeague()?"Success":"Failed";
		
		
		return returnMessage;
	}
	
	@RequestMapping(value="/testPage")
	@ResponseBody
	public ModelAndView testMyPage(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
	
		return new ModelAndView("LeagueInfoPage");
	}
}
