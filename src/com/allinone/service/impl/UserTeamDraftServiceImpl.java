/**
 * 
 */
package com.allinone.service.impl;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allinone.dao.api.LeagueDaoAPI;
import com.allinone.dao.api.UserTeamDraftDaoAPI;
import com.allinone.service.api.UserTeamDraftServiceAPI;


/**
 * @author rahul
 *
 */
@Transactional
@Service
public class UserTeamDraftServiceImpl implements UserTeamDraftServiceAPI {

	@Autowired
	LeagueDaoAPI objLeagueDao;
	
	@Autowired
	UserTeamDraftDaoAPI objTeamDraftDaoImpl;

	@Override
	public boolean updateTeam(Set<String> setOfPlayerIds, String leagueId, String userId, String userTeamId,
			int numSubstitutesLeft, double score) {
		// TODO Auto-generated method stub
		Set<String> playerIds = new HashSet<String>();
		playerIds.add("152043f85f7554d4015f7555e1c70008");
		
		setOfPlayerIds = playerIds;
		leagueId = "152043f85f7550ef015f7551e8d90002";
		userId = "152043f85f7550ef015f7551b7290000";
		userTeamId = "";
		numSubstitutesLeft = 50;
		score = 0;
		
	
		return objTeamDraftDaoImpl.updateTeam(setOfPlayerIds, leagueId, userId, userTeamId, numSubstitutesLeft, score);
	}

	@Override
	public boolean updateTeamName(String leagueId, String userId, String userTeamId, String teamName) {
		// TODO Auto-generated method stub
		
		return objTeamDraftDaoImpl.updateTeamName(leagueId, userId, userTeamId, teamName);
	}

	@Override
	public boolean createTeam(String leagueId, String userId) {
		// TODO Auto-generated method stub
		return objTeamDraftDaoImpl.createTeam(leagueId, userId);
	}

	

}
