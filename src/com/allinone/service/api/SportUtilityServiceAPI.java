/**
 * 
 */
package com.allinone.service.api;

/**
 * @author rahul
 *
 */
public interface SportUtilityServiceAPI {

	public boolean readEntriesToDatabase() throws Exception;
	
	public boolean addNewSport();
	
	public boolean createLeague();

	//boolean createUserLeague(String leagueName, String leagueId);

	public String createUserLeague(String leagueName, String leagueId, String userId);
	
}
