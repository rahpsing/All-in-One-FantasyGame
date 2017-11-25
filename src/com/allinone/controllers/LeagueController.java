
package com.allinone.controllers;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.allinone.pojos.League;
import com.allinone.pojos.Player;
import com.allinone.pojos.Team;
import com.allinone.service.api.LeagueServiceAPI;
import com.allinone.service.api.ListToJsonTwoColumnsServiceAPI;
import com.allinone.service.api.SportUtilityServiceAPI;
import com.allinone.service.api.TeamListToJsonServiceAPI;
import com.allinone.service.api.UserTeamDraftServiceAPI;
import com.google.gson.Gson;

@Controller

public class LeagueController {
	
	@Autowired
	SportUtilityServiceAPI objSportUtility;
	
	@Autowired
	LeagueServiceAPI objLeagueService;
	
	@Autowired
	UserTeamDraftServiceAPI objTeamService;
	
	@Autowired
	ListToJsonTwoColumnsServiceAPI objListToJson;
	
	@Autowired
	TeamListToJsonServiceAPI objTeamListToJson;
	
	@RequestMapping(value="/fetchLeagues")
	@ResponseBody
	public String fetchLeagues(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		String comparator=objRequest.getParameter("VALUE");
		String returnMessage = objLeagueService.fetchLeagues(objRequest.getParameter("SPORT_NAME"),comparator);
		
		//System.out.println(comparator);
	
		return returnMessage;
	}
	
	
	
	@RequestMapping(value="/redirectLeague")
	public String redirectLeague(HttpServletRequest objRequest, HttpServletResponse objResponse,ModelMap model) {
		//for search functionality
		String returnMessage = objLeagueService.fetchLeagues(objRequest.getParameter("redirectValue"),"redirectText");
		
		String userId=objRequest.getParameter("userId");
		System.out.println(userId+"   from redirect");
		model.put("userId", objRequest.getParameter("userId"));
		model.put("leagueId",objRequest.getParameter("redirectValue"));
		model.put("name",returnMessage);
		return "LeagueInfoPage";
	}
	
	
	
	@RequestMapping(value="/playerList")
	@ResponseBody
	public String playerList(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		List<Player> returnList = objLeagueService.playerList(objRequest.getParameter("leagueId"),objRequest.getParameter("userId"));
		
		String jsonString=objTeamListToJson.listToJson("Players", returnList);
		System.out.println(objRequest.getParameter("leagueId") +"  Like League at service");
		return jsonString;
	}
	
	@RequestMapping(value="/userTeamList")
	@ResponseBody
	public String userTeamList(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		
		String returnMessage = objLeagueService.userTeamSet(objRequest.getParameter("leagueId"),objRequest.getParameter("userId"));
		
		
		return returnMessage;
	}
	
	@RequestMapping(value="/redirectToTeam")
	public String redirectToTeam(HttpServletRequest objRequest, HttpServletResponse objResponse,ModelMap model) {
		String flag=objRequest.getParameter("flag");
		String leagueId=objRequest.getParameter("leagueId");
		String userId=objRequest.getParameter("userId");
		model.put("leagueId", leagueId);
		model.put("userId", userId);
		model.put("flag", flag);
		if(flag.equals("create")) {
			model.put("teamName", "Playing Eleven");
		}
		else if(flag.equals("edit")) {
			String teamName=objTeamService.getUserTeamName(leagueId, userId);
			model.put("teamName", teamName);
		}
		return "TeamDraftPage";
	}
	
	@RequestMapping(value="/createLeague")
	@ResponseBody
	public String createLeague(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String returnMessage = objSportUtility.createLeague()?"Success":"Failed";
		
		
		return returnMessage;
	}
	
	
	@RequestMapping(value="/checkLeagueMembership")
	@ResponseBody
	public String checkLeagueMembership(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String userId = objRequest.getParameter("userId");
		String leagueId = objRequest.getParameter("leagueId");
		System.out.println("userId is =" + userId);
		System.out.println("league is =" + leagueId);
		if(objLeagueService.hasUserJoinedLeague(userId, leagueId)) {
			return "true";
		}
		return "false";
	}
	
	@RequestMapping(value="/fetchUserTeams")
	@ResponseBody
	public String fetchUserTeams(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		
		String leagueId = objRequest.getParameter("leagueId");
		
		
			return objLeagueService.fetchUserTeams(leagueId);
		
	}
	
	@RequestMapping(value="/testPage")
	@ResponseBody
	public ModelAndView testMyPage(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
	
		return new ModelAndView("UserDashboard");
	}
	
	@RequestMapping(value="/uploadGame")
	@ResponseBody
	public void uploadGame(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String leagueId = objRequest.getParameter("leagueId");
		String gameId = objRequest.getParameter("gameId");
		objLeagueService.getUserScoresForAGame(leagueId, gameId);
		//return new ModelAndView("UserDashboard");
	}
	
	@RequestMapping(value="/rulesMap")
	@ResponseBody
	public String rulesMap(HttpServletRequest objRequest, HttpServletResponse objResponse){
		
		return objLeagueService.rulesMap(objRequest.getParameter("leagueId"));
		/*for(String key:rulesMap.keySet()) {
			System.out.println("Key value=  "+ key + "  Pair value =  "+ rulesMap.get(key));
		}*/
	}
}

