package com.allinone.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allinone.pojos.League;
import com.allinone.service.api.LeagueServiceAPI;
import com.allinone.service.api.ListToJsonTwoColumnsServiceAPI;
import com.allinone.service.api.SportUtilityServiceAPI;

@Transactional
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
		
		List<League> returnMessage = objLeagueService.fetchLeagues(objRequest.getParameter("SPORT_NAME"));
		
		
	    String jsonString = objListToJson.listToJson("League", returnMessage);
		//System.out.println(jsonString);
		return jsonString;
	}
	
	@RequestMapping(value="/fetchLikeLeagues")
	@ResponseBody
	public String fetchLikeLeagues(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		//for search functionality
		List<League> returnMessage = objLeagueService.fetchLikeLeagues(objRequest.getParameter("SEARCH_TEXT"));
		System.out.println(objRequest.getParameter("SEARCH_TEXT"));
		//System.out.println(returnMessage.size());
		
		String jsonString = objListToJson.listToJson("League", returnMessage);
		System.out.println(jsonString);
		return jsonString;		
	}
	
	
	@RequestMapping(value="/createLeague")
	@ResponseBody
	public String createLeague(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String returnMessage = objSportUtility.createLeague()?"Success":"Failed";
		
		
		return returnMessage;
	}
}
