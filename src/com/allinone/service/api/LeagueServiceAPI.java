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

	public List<League> fetchLeagues(String sport,String Comparator);
	
	
}
