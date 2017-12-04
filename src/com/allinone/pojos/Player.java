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
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author rahul
 *
 */
public class Player implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String firstName;
	private String lastName;
	private String playerRole;
	private String uniqueId;
	//private Sport sport;
	private Set<League> setOfLeagues = new HashSet<League>();
	private Set<UserTeam> setOfUserTeams = new HashSet<UserTeam>();
	private Team team;
	private byte[] profileImage;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Player [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", playerRole=" + playerRole
				+ ", uniqueId=" + uniqueId + ", team=" + team + ", profileImage=" + Arrays.toString(profileImage) + "]";
	}
	public Set<UserTeam> getSetOfUserTeams() {
		return setOfUserTeams;
	}
	public void setSetOfUserTeams(Set<UserTeam> setOfUserTeams) {
		this.setOfUserTeams = setOfUserTeams;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public Team getTeam() {
		return team;
	}
	public void setTeam(Team team) {
		this.team = team;
	}
	public byte[] getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(byte[] profileImage) {
		this.profileImage = profileImage;
	}

	public String getPlayerRole() {
		return playerRole;
	}
	public void setPlayerRole(String playerRole) {
		this.playerRole = playerRole;
	}
	public String getUniqueId() {
		return uniqueId;
	}
	public void setUniqueId(String uniqueId) {
		this.uniqueId = uniqueId;
	}
	public Set<League> getSetOfLeagues() {
		return setOfLeagues;
	}
	public void setSetOfLeagues(Set<League> setOfLeagues) {
		this.setOfLeagues = setOfLeagues;
	}


}