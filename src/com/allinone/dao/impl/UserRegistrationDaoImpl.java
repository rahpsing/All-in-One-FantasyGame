package com.allinone.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allinone.dao.api.UserRegistrationDaoAPI;
import com.allinone.pojos.User;

@Repository
public class UserRegistrationDaoImpl implements UserRegistrationDaoAPI {

	@Autowired
	private SessionFactory objSessionFactory;
	
	@Override
	public boolean addUser(String userName, String password, String emailAddress, String phoneNumber) {
		// TODO Auto-generated method stub
		
		User user = new User();

		user.setAdmin(false);
		user.setUserName(userName);
		user.setPassword(password);
		user.setEmailAddress(emailAddress);
		user.setPhoneNumber(phoneNumber);
		
		try {
			objSessionFactory.getCurrentSession().saveOrUpdate(user);
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}

	@Override
	public boolean checkUserLogin(String userName, String password) {
		// TODO Auto-generated method stub
		try {
				Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(User.class);
				Criterion usernameCriteria = Restrictions.eq("userName", userName);
				Criterion passwordCriteria = Restrictions.eq("password", password);
				objCriteria.add(Restrictions.and(usernameCriteria, passwordCriteria));

				List results = objCriteria.list();
				if(results == null || results.isEmpty())
					return false;
				
				} catch(Exception e) {
					System.out.println(e);
					return false;
				}
				
				return true;
	}

}
