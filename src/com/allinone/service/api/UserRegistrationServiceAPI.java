/**
 * 
 */
package com.allinone.service.api;

/**
 * @author rahul
 *
 */
public interface UserRegistrationServiceAPI {

	public boolean addUser(String userName, String password, String emailAddress, String phoneNumber);
	public boolean checkUserLogin(String userName, String password);
}
