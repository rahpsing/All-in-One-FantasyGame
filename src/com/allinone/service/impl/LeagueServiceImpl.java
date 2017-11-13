/**
 * 
 */
package com.allinone.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allinone.dao.api.LeagueDaoAPI;
import com.allinone.dao.api.SportUtilityDaoAPI;
import com.allinone.pojos.League;
import com.allinone.pojos.Player;
import com.allinone.pojos.UserTeam;
import com.allinone.service.api.LeagueServiceAPI;
import com.allinone.service.api.ListToJsonTwoColumnsServiceAPI;
import com.allinone.service.api.TeamListToJsonServiceAPI;
import com.allinone.service.api.TeamSetToJsonAPI;

/**
 * @author rahul
 *
 */
@Transactional
@Service
public class LeagueServiceImpl implements LeagueServiceAPI {

	@Autowired
	ListToJsonTwoColumnsServiceAPI objListToJson;
	
	@Autowired
	TeamSetToJsonAPI objTeamSetToJson;
	
	@Autowired
	TeamListToJsonServiceAPI objTeamListToJson;
	
	@Autowired
	LeagueDaoAPI objLeagueDao;
	
	@Autowired
	SportUtilityDaoAPI objSportUtilityDao;

	@Override
	public String fetchLeagues(String sport,String comparator) {
		// TODO Auto-generated method stub
		
		List<League> listOfLeagues = new ArrayList<League>();
		String sportId;
		if(comparator.equals("redirectText")) {
			listOfLeagues = objLeagueDao.fetchLikeLeagues(sport);
			System.out.println(sport);
			return listOfLeagues.get(0).getLeagueName();
		}
		if(comparator.equals("searchText")) {
			listOfLeagues = objLeagueDao.fetchLikeLeagues(sport);
			System.out.println(sport);
						
			String jsonString = objListToJson.listToJson("League", listOfLeagues);
			System.out.println(jsonString + "returning result " + comparator);
			
			return jsonString;
		}
		if (sport.equals("CRICKET")) {
			sportId=objSportUtilityDao.getsportID("CRICKET");
		}
		else {sportId=objSportUtilityDao.getsportID("SOCCER");}
		
		listOfLeagues = objLeagueDao.fetchLeagues(sportId);
		
		String jsonString = objListToJson.listToJson("League", listOfLeagues);
		System.out.println(jsonString + "returning result " + comparator);
		
		return jsonString;
		
	}

	@Override
	public List<Player> playerList(String likeLeague){
		List<Player> listOfPlayer=new ArrayList<Player>();
		List<League> listOfLeagues = new ArrayList<League>();
		listOfLeagues = objLeagueDao.fetchLikeLeagues(likeLeague);
		
		for(Player i: listOfLeagues.get(0).getSetOfPlayers()) {
			listOfPlayer.add(i);
		}
		
		return listOfPlayer;
	}

	@Override
	public boolean hasUserJoinedLeague(String userId, String leagueId) {
		// TODO Auto-generated method stub
		
		return objLeagueDao.hasUserJoinedLeague(userId, leagueId);
	}
	
	@Override
	public String fetchUserTeams(String leagueId) {
		// TODO Auto-generated method stub
		
		Set<UserTeam>returnSet = objLeagueDao.fetchUserTeams(leagueId);
		String jsonString=objTeamSetToJson.listToJson("userTeam", returnSet);
		return jsonString;
	}
	

	@Override
	public String userTeamSet(String leagueId,String userId) {
		// TODO Auto-generated method stub
		
		Set<Player> returnSet = objLeagueDao.userTeamSet(leagueId, userId);
		List<Player> returnList = new ArrayList<Player>(returnSet);
		String jsonString=objTeamListToJson.listToJson("usersTeam", returnList);
		return jsonString;
	}
	

}
