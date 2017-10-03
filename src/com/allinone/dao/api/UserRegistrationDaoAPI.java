/**
 * 
 */
package com.allinone.dao.api;

/**
 * @author rahul
 *
 */
public interface UserRegistrationDaoAPI {

	public boolean addUser(String userName, String password, String emailAddress, String phoneNumber);

	public boolean checkUserLogin(String userName, String password);
}
