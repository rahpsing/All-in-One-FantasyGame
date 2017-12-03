package com.allinone.controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allinone.pojos.League;
import com.allinone.service.api.LeagueServiceAPI;
import com.allinone.service.api.ListToJsonTwoColumnsServiceAPI;
import com.allinone.service.api.SportUtilityServiceAPI;
import com.allinone.service.api.TeamListToJsonServiceAPI;
import com.allinone.service.api.UserTeamDraftServiceAPI;
import com.google.gson.Gson;

@Controller

public class TeamDraftController {
	
	@Autowired
	SportUtilityServiceAPI objSportUtility;
	
	@Autowired
	UserTeamDraftServiceAPI objUserTeamDraftAPI;
	
	@Autowired
	ListToJsonTwoColumnsServiceAPI objListToJson;
	
	@Autowired
	TeamListToJsonServiceAPI objTeamListToJson;

	private Set playerSet;
	
	@RequestMapping(value="/createTeam")
	@ResponseBody
	public String fetchLeagues(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String userId = objRequest.getParameter("userId");
		String leagueId = objRequest.getParameter("leagueId");
		String listOfPlayerIds = objRequest.getParameter("listOfPlayerIds");
		String flag = objRequest.getParameter("flag");
		String teamName = objRequest.getParameter("updateTeamName");
		
		List<String> listOfPlayerIdsList = new Gson().fromJson( listOfPlayerIds, List.class);
		playerSet = new HashSet(listOfPlayerIdsList);
		
		String returnString;
		Boolean teamNameBoolean;
		if(flag.equals("create")) {
		returnString =objUserTeamDraftAPI.createTeam(playerSet,leagueId, userId,teamName);
		
		}
		else {
			
			String userTeamId=objUserTeamDraftAPI.getUserTeamId(leagueId, userId);
			
			returnString=objUserTeamDraftAPI.updateTeam(playerSet, leagueId, userId, userTeamId, 50, 50);
			
			
		}
		
		if(returnString.equals("false"))
		{
			return "false";
		}
		
		return "true";
	}
	
	@RequestMapping(value="/fetchSwapsAndScores")
	@ResponseBody
	public String fetchSwapsAndScores(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String leagueId = objRequest.getParameter("leagueId");
		String userId = objRequest.getParameter("userId");
		String userTeamId=objUserTeamDraftAPI.getUserTeamId(leagueId, userId);
		return objUserTeamDraftAPI.getUserTeamDetails(userTeamId);
	
		
	}
	
	@RequestMapping(value="/updateTeamName")
	@ResponseBody
	public String updateTeamName(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String leagueId = objRequest.getParameter("leagueId");
		String userId = objRequest.getParameter("userId");
		String userTeamId=objUserTeamDraftAPI.getUserTeamId(leagueId, userId);
		String teamName = objRequest.getParameter("updateTeamName");
		if(objUserTeamDraftAPI.updateTeamName(leagueId, userId, userTeamId, teamName)) {
			return "true";
		}
		return "false";
	}
}
