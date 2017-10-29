/**
 * 
 */
package com.allinone.service.api;

import java.util.List;
import java.util.Set;

import com.allinone.pojos.League;
import com.allinone.pojos.Player;

/**
 * @author rahul
 *
 */
public interface LeagueServiceAPI {

	public List<League> fetchLeagues(String sport,String Comparator);

	public List<Player> playerList(String likeLeague);
	
	
}
