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
public class UserTeam implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private User usert;
	private int numSubstitutesLeft;
	private League league;
	private double score;
	private Set<Player> setOfPlayers;
	private String teamName;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public User getUsert() {
		return usert;
	}
	public void setUsert(User usert) {
		this.usert = usert;
	}
	public int getNumSubstitutesLeft() {
		return numSubstitutesLeft;
	}
	public void setNumSubstitutesLeft(int numSubstitutesLeft) {
		this.numSubstitutesLeft = numSubstitutesLeft;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public Set<Player> getSetOfPlayers() {
		return setOfPlayers;
	}
	public void setSetOfPlayers(Set<Player> setOfPlayers) {
		this.setOfPlayers = setOfPlayers;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	
	@Override
	public String toString() {
		return "UserTeam [id=" + id + ", user=" + usert + ", numSubstitutesLeft=" + numSubstitutesLeft + ", score="
				+ score + ", listOfPlayers=" + setOfPlayers + ", teamName=" + teamName + "]";
	}
	public League getLeague() {
		return league;
	}
	public void setLeague(League league) {
		this.league = league;
	}

}
