/**
 * 
 */
package com.allinone.pojos;

import java.io.Serializable;
import java.util.Arrays;
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
	private Set<String> setOfPrimaryRoles;
	//private Set<Team> setOfTeams;
	private Sport sport;
	private byte[] profileImage;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Set<String> getSetOfPrimaryRoles() {
		return setOfPrimaryRoles;
	}
	public void setSetOfPrimaryRoles(Set<String> setOfPrimaryRoles) {
		this.setOfPrimaryRoles = setOfPrimaryRoles;
	}
/*	public Set<Team> getSetOfTeams() {
		return setOfTeams;
	}
	public void setSetOfTeams(Set<Team> setOfTeams) {
		this.setOfTeams = setOfTeams;
	}*/
	public Sport getSport() {
		return sport;
	}
	public void setSport(Sport sport) {
		this.sport = sport;
	}
	public byte[] getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(byte[] profileImage) {
		this.profileImage = profileImage;
	}
	@Override
	public String toString() {
		return "Player [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + "]";
	}

	
	
	
	
	

}