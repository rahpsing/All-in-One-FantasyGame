/**
 * 
 */
package com.allinone.dao.api;

import java.util.Map;

import com.allinone.pojos.Game;

/**
 * @author rahul
 *
 */
public interface SportUtilityDaoAPI {

	public boolean addEntriesToDatabase();

	boolean addNewSportEntry();
	
	public boolean createLeague();

	public String getsportID(String sportName);
	
	public Map<String, Map<String, Double>> readGameScores(Game game);


}
