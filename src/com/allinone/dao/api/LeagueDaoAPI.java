/**
 * 
 */
package com.allinone.dao.api;

import java.util.List;

import com.allinone.pojos.League;
import com.allinone.pojos.Player;

/**
 * @author rahul
 *
 */
public interface LeagueDaoAPI {

	public List<League> fetchLeagues(String sport);

	public List<League> fetchLikeLeagues(String likeLeague);

	

}
