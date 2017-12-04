/**
 * 
 */
package com.allinone.service.api;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.allinone.pojos.League;
import com.allinone.pojos.Player;

/**
 * @author rahul
 *
 */
public interface LeagueServiceAPI {

	public String fetchLeagues(String sport,String Comparator,String userId);

	public Map<String,Double> updateUserScoresForAGame(String leagueId, String gameId);
	
	public boolean hasUserJoinedLeague(String userId, String leagueId);

	public String fetchUserTeams(String leagueId);

	public String userTeamSet(String leagueId, String userId);

	public List<Player> playerList(String leagueId, String userId);

	public String rulesMap(String leagueId);

	public String gamesList(String leagueId);

	public String checkIfUserIsAdmin(String leagueId, String userId);

	public String fetchAvailableLeagueNames(String sport, String comparator);

	public String removeUserTeam(String leagueId, String userTeamId);

	
	
}
