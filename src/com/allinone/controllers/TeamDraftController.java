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
import com.allinone.service.api.ListToJsonTwoColumnsServiceAPI;
import com.allinone.service.api.SportUtilityServiceAPI;
import com.allinone.service.api.TeamListToJsonServiceAPI;
import com.allinone.service.api.UserTeamDraftServiceAPI;

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
	public boolean fetchLeagues(HttpServletRequest objRequest, HttpServletResponse objResponse) {
		
		String userId = objRequest.getParameter("userId");
		String leagueId = objRequest.getParameter("leagueId");
		
		return objUserTeamDraftAPI.createTeam(leagueId, userId);
	}
	
	

}
