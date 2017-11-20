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
public class Team implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String teamName;
	private String teamInitials;
	private Set<Player> setOfPlayers;
	//private List<Game> listOfGames;
	private League league;
	//private byte[] teamLogo;
	
	public League getLeague() {
		return league;
	}
	public void setLeague(League league) {
		this.league = league;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public Set<Player> getSetOfPlayers() {
		return setOfPlayers;
	}
	public void setSetOfPlayers(Set<Player> setOfPlayers) {
		this.setOfPlayers = setOfPlayers;
	}
/*	public byte[] getTeamLogo() {
		return teamLogo;
	}
	public void setTeamLogo(byte[] teamLogo) {
		this.teamLogo = teamLogo;
	}*/
	@Override
	public String toString() {
		return "Team [id=" + id + ", teamName=" + teamName + ", league=" + league + "]";
	}
	public String getTeamInitials() {
		return teamInitials;
	}
	public void setTeamInitials(String teamInitials) {
		this.teamInitials = teamInitials;
	}
/*	public List<Game> getListOfGames() {
		return listOfGames;
	}
	public void setListOfGames(List<Game> listOfGames) {
		this.listOfGames = listOfGames;
	}*/

	
	
	

}