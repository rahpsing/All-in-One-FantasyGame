/**
 * 
 */
package com.allinone.service.api;

import com.allinone.pojos.User;

/**
 * @author rahul
 *
 */
public interface UserRegistrationServiceAPI {

	public boolean addUser(String userName, String password, String emailAddress, String phoneNumber);
	public User checkUserLogin(String userName, String password);
}
