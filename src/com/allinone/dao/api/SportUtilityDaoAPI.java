/**
 * 
 */
package com.allinone.dao.api;

import java.util.Map;

import com.allinone.pojos.Game;
import com.allinone.pojos.League;

/**
 * @author rahul
 *
 */
public interface SportUtilityDaoAPI {

	public boolean addEntriesToDatabase() throws Exception;

	boolean addNewSportEntry();
	
	public boolean createLeague();

	public String getsportID(String sportName);
	
	public Map<String, Map<String, Double>> readGameScores(Game game);

	public String createUserLeague(String leagueName, String leagueId,String userId);


}
