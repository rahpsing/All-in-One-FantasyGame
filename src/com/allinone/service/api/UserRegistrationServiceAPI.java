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

	public String addUser(String userName, String password, String emailAddress, String phoneNumber,String firstName,String lastName);
	public User checkUserLogin(String userName, String password);
	public String updateUser(String userId,String emailId, String phoneNum,String firstName,String lastName);
	public User pullUser(String userName);
}
