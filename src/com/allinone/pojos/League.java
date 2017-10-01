/**
 * 
 */
package com.allinone.pojos;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**
 * @author rahul
 *
 */
public class League implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String leagueName;
	private Set<Team> setOfTeams;
	private List<Game> listOfGames;
	private boolean isSystemLeague;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLeagueName() {
		return leagueName;
	}
	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}
	public Set<Team> getSetOfTeams() {
		return setOfTeams;
	}
	public void setSetOfTeams(Set<Team> setOfTeams) {
		this.setOfTeams = setOfTeams;
	}
	public List<Game> getListOfGames() {
		return listOfGames;
	}
	public void setListOfGames(List<Game> listOfGames) {
		this.listOfGames = listOfGames;
	}
	public boolean isSystemLeague() {
		return isSystemLeague;
	}
	public void setSystemLeague(boolean isSystemLeague) {
		this.isSystemLeague = isSystemLeague;
	}
	@Override
	public String toString() {
		return "League [id=" + id + ", leagueName=" + leagueName + ", setOfTeams=" + setOfTeams + ", isSystemLeague="
				+ isSystemLeague + "]";
	}
	
	
	

}
