/**
 * 
 */
package com.allinone.pojos;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Set;

/**
 * @author rahul
 *
 */
public class Sport implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String sportName;
	private Set<String> setOfRoles;
	private Set<String> setOfMetrics;
	//private Set<Player> setOfPlayers;
	//private Set<Team> setOfTeams;
	private Set<League> setOfLeagues;
	public String getId() {
		return id;	
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSportName() {
		return sportName;
	}
	public void setSportName(String sportName) {
		this.sportName = sportName;
	}
	public Set<String> getSetOfRoles() {
		return setOfRoles;
	}
	public void setSetOfRoles(Set<String> setOfRoles) {
		this.setOfRoles = setOfRoles;
	}
/*	public Set<Player> getSetOfPlayers() {
		return setOfPlayers;
	}
	public void setSetOfPlayers(Set<Player> setOfPlayers) {
		this.setOfPlayers = setOfPlayers;
	}*/
/*	public Set<Team> getSetOfTeams() {
		return setOfTeams;
	}
	public void setSetOfTeams(Set<Team> setOfTeams) {
		this.setOfTeams = setOfTeams;
	}*/
	public Set<League> getSetOfLeagues() {
		return setOfLeagues;
	}
	public void setSetOfLeagues(Set<League> setOfLeagues) {
		this.setOfLeagues = setOfLeagues;
	}
	@Override
	public String toString() {
		return "Sport [id=" + id + ", sportName=" + sportName + "]";
	}
	public Set<String> getSetOfMetrics() {
		return setOfMetrics;
	}
	public void setSetOfMetrics(Set<String> setOfMetrics) {
		this.setOfMetrics = setOfMetrics;
	}
		
	
}
