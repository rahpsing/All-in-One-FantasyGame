/**
 * 
 */
package com.allinone.service.api;

import java.util.List;

import com.allinone.pojos.League;

/**
 * @author rahul
 *
 */
public interface LeagueServiceAPI {

	
	//for search functionality
	public List<League> fetchLikeLeagues(String LikeLeague);
	public List<League> fetchLeagues(String sport);
	
}
