/**
 * 
 */
package com.allinone.pojos;

import java.io.Serializable;
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
	private Set<Player> setOfPlayers;
	//private byte[] teamLogo;
	
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
		return "Team [id=" + id + ", teamName=" + teamName + "]";
	}
	
	
	

}