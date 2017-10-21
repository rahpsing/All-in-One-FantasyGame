/**
 * 
 */
package com.allinone.dao.api;

import java.util.List;

import com.allinone.pojos.League;

/**
 * @author rahul
 *
 */
public interface LeagueDaoAPI {

	public List<League> fetchLeagues();

	public List<League> fetchLikeLeagues(String likeLeague);




}
