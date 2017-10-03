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
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String userId;
	private String userName;
	private String emailAddress;
	private String phoneNumber;
	private String password;
	boolean isAdmin;
	private Set<League> setOfLeagues;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", emailAddress=" + emailAddress + ", phoneNumber="
				+ phoneNumber + ", isAdmin=" + isAdmin + "]";
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Set<League> getSetOfLeagues() {
		return setOfLeagues;
	}
	public void setSetOfLeagues(Set<League> setOfLeagues) {
		this.setOfLeagues = setOfLeagues;
	}
	
	

}
