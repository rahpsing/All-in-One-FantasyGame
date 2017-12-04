package com.allinone.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allinone.service.api.LeagueServiceAPI;
import com.allinone.service.api.SportUtilityServiceAPI;

@Controller
public class UserLeagueController {
	@Autowired
	SportUtilityServiceAPI objSportUtility;
	
	@Autowired
	LeagueServiceAPI objLeagueService;
	
	@RequestMapping(value="/createUserLeague")
	
	public String initializeSystem(HttpServletRequest objRequest, HttpServletResponse objResponse,ModelMap model) {
		
		String returnMessage = "Failed";
		//String returnMessage = objSportUtility.addNewSport()?"Success":"Failed";
		//String returnMessage2 = objSportUtility.createLeague()?"Success":"Failed";
		//String leagueName="MyCricketLeague";
		//String leagueId="4028b8816018fc06016018fc240b0001";
		String leagueId=objRequest.getParameter("parentleagueId");
		String leagueName=objRequest.getParameter("leagueName");
		String userId=objRequest.getParameter("userId");
		String returnString=objSportUtility.createUserLeague(leagueName, leagueId,userId);
		if(!returnString.equals("false"))
			returnMessage = returnString;
		model.put("leagueId", returnMessage);
		model.put("userId", userId);
		model.put("flag", "create");
		
		model.put("teamName", "");
		
		return "TeamDraftPage";
		
		
	}
	@RequestMapping(value="/removeUserTeam")
	@ResponseBody
	public String removeUserTeam(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		String leagueId=objRequest.getParameter("leagueId");
		String userTeamId=objRequest.getParameter("userTeamId");
		return objLeagueService.removeUserTeam(leagueId, userTeamId);
	}
}
