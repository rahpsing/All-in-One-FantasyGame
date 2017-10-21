/**
 * 
 */
package com.allinone.dao.api;

/**
 * @author rahul
 *
 */
public interface SportUtilityDaoAPI {

	public boolean addEntriesToDatabase();

	boolean addNewSportEntry();
	
	public boolean createLeague();

	public String getsportID(String sportName);


}
