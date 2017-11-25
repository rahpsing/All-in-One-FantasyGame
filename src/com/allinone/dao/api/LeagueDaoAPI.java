/**
 * 
 */
package com.allinone.dao.api;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.allinone.pojos.League;
import com.allinone.pojos.Player;
import com.allinone.pojos.UserTeam;

/**
 * @author rahul
 *
 */
public interface LeagueDaoAPI {

	public List<League> fetchLeagues(String sport);

	public List<League> fetchLikeLeagues(String likeLeague);
	
	public boolean hasUserJoinedLeague(String userId, String leagueId);

	public Set<UserTeam> fetchUserTeams(String leagueId);

	

	public Set<Player> userTeamSet(String leagueId,String userId);

	public Map<String, Integer> rulesMap(String leagueId);



	

	

}
