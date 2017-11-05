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
import com.allinone.util.EmailUtility;

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
	public String addUser(String userName, String password, String emailAddress, String phoneNumber,String firstName,String lastName) {
		// TODO Auto-generated method stub
		String status = objUserRegistrationDao.addUser(userName, password, emailAddress, phoneNumber,firstName,lastName);
		
		if(status.equals("Success"))
			EmailUtility.sendEmail(emailAddress, userName);
		
		return status;
		
	}

	@Override
	public User checkUserLogin(String userName, String password) {
		// TODO Auto-generated method stub
		return objUserRegistrationDao.checkUserLogin(userName, password);
	}
	
	@Override
	public User pullUser(String userName) {
		// TODO Auto-generated method stub
		return objUserRegistrationDao.pullUser(userName);
	}
	
	@Override
	public String updateUser(String userId,String emailId,String phoneNum,String firstName,String lastName) {
		
		
		return objUserRegistrationDao.updateUser(userId, emailId, phoneNum,firstName,lastName);
	}

}

