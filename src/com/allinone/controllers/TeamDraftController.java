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
	
	@RequestMapping(value="/createTeam")
	@ResponseBody
	public String fetchLeagues(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String userId = objRequest.getParameter("userId");
		String leagueId = objRequest.getParameter("leagueId");
		String listOfPlayerIds = objRequest.getParameter("listOfPlayerIds");
		String flag = objRequest.getParameter("flag");
		//String teamName = objRequest.getParameter("teamName");
		List<String> listOfPlayerIdsList = new Gson().fromJson( listOfPlayerIds, List.class);
		Set playerSet=new HashSet(listOfPlayerIdsList);
		System.out.println("Done");
		String returnString;
		//Boolean teamNameBoolean;
		if(flag.equals("create")) {
		returnString =objUserTeamDraftAPI.createTeam(playerSet,leagueId, userId);
		//teamNameBoolean=objUserTeamDraftAPI.updateTeamName(leagueId, userId, returnString, teamName);
		}
		else {
			
			String userTeamId=objUserTeamDraftAPI.getUserTeamId(leagueId, userId);
			
			returnString=objUserTeamDraftAPI.updateTeam(playerSet, leagueId, userId, userTeamId, 50, 50);
			//teamNameBoolean=objUserTeamDraftAPI.updateTeamName(leagueId, userId, returnString, teamName);
		}
		if(returnString.equals("false"))
		{
			return "false";
		}
		
		return "true";
	}
	
}
