package com.allinone.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
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
	public boolean addUser(String userName, String password, String emailAddress, String phoneNumber,String firstName,String lastName) {
		// TODO Auto-generated method stub
		
		User user = new User();

		user.setAdmin(false);
		user.setUserName(userName);
		user.setPassword(password);
		user.setEmailAddress(emailAddress);
		user.setPhoneNumber(phoneNumber);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		
		try {
			objSessionFactory.getCurrentSession().saveOrUpdate(user);
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}

	@Override
	public User checkUserLogin(String userName, String password) {
		// TODO Auto-generated method stub
		try {
				Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(User.class);
				Criterion usernameCriteria = Restrictions.eq("userName", userName);
				Criterion passwordCriteria = Restrictions.eq("password", password);
				objCriteria.add(Restrictions.and(usernameCriteria, passwordCriteria));

				List results = objCriteria.list();
				Iterator iterator = results.iterator();
				User temp=(User) iterator.next();
				if(results == null || results.isEmpty())
					return null;
				System.out.println(temp.getUserId());
				return temp;
				
				} catch(Exception e) {
					System.out.println(e);
					return null;
				}
				
				
	}
	
	@Override
	public String updateUser(String userId,String emailId,String phoneNum,String firstName,String lastName) {
		
		Session session = objSessionFactory.getCurrentSession();
		
		User user = session.get(User.class, userId);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setEmailAddress(emailId);
		//temp.setPassword(password);
		user.setPhoneNumber(phoneNum);
		try {
			session.saveOrUpdate(user);
		}
		catch(Exception e) {
			System.out.println(e);
			return "failed";
		}
		return "success";
	}
	

}
