package com.allinone.controllers;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allinone.pojos.League;
import com.allinone.service.api.LeagueServiceAPI;
import com.allinone.service.api.SportUtilityServiceAPI;

@Controller
public class LeagueController {
	
	@Autowired
	SportUtilityServiceAPI objSportUtility;
	
	@Autowired
	LeagueServiceAPI objLeagueService;
	
	
	@RequestMapping(value="/fetchLeagues")
	@ResponseBody
	public String fetchLeagues(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		List<League> returnMessage = objLeagueService.fetchLeagues();
		
		
		return returnMessage.toString();
	}
	
	
	@RequestMapping(value="/createLeague")
	@ResponseBody
	public String createLeague(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String returnMessage = objSportUtility.createLeague()?"Success":"Failed";
		
		
		return returnMessage;
	}
}
