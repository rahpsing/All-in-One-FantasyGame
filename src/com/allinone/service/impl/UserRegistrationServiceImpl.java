/**
 * 
 */
package com.allinone.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allinone.dao.api.UserRegistrationDaoAPI;
import com.allinone.pojos.User;
import com.allinone.service.api.UserRegistrationServiceAPI;

/**
 * @author rahul
 *
 */
@Transactional
@Service
public class UserRegistrationServiceImpl implements UserRegistrationServiceAPI {

	@Autowired
	UserRegistrationDaoAPI objUserRegistrationDao;
	
	@Override
	public boolean addUser(String userName, String password, String emailAddress, String phoneNumber) {
		// TODO Auto-generated method stub
		return objUserRegistrationDao.addUser(userName, password, emailAddress, phoneNumber);
	}

	@Override
	public User checkUserLogin(String userName, String password) {
		// TODO Auto-generated method stub
		return objUserRegistrationDao.checkUserLogin(userName, password);
	}

}
