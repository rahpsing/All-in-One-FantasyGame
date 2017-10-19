package com.allinone.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allinone.dao.api.LeagueDaoAPI;
import com.allinone.dao.api.SportUtilityDaoAPI;
import com.allinone.pojos.League;
import com.allinone.pojos.Player;
import com.allinone.pojos.Sport;
import com.allinone.pojos.User;

@Repository
public class LeagueDaoImpl implements LeagueDaoAPI {

	@Autowired
	private SessionFactory objSessionFactory;



	@Override
	public List<League> fetchLeagues() {
		// TODO Auto-generated method stub
		Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(League.class);
		List<League> listOfLeagues = new ArrayList<League>();
		listOfLeagues = objCriteria.list();
		
		
		return listOfLeagues;
	}
	

}
