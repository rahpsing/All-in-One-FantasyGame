/**
 * 
 */
package com.allinone.dao.api;

import java.util.List;

import com.allinone.pojos.User;

/**
 * @author rahul
 *
 */
public interface UserRegistrationDaoAPI {

	public boolean addUser(String userName, String password, String emailAddress, String phoneNumber);

	public User checkUserLogin(String userName, String password);
}
