/**
 * 
 */
package com.allinone.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allinone.dao.api.LeagueDaoAPI;
import com.allinone.dao.api.SportUtilityDaoAPI;
import com.allinone.pojos.League;
import com.allinone.service.api.LeagueServiceAPI;

/**
 * @author rahul
 *
 */
@Transactional
@Service
public class LeagueServiceImpl implements LeagueServiceAPI {

	@Autowired
	LeagueDaoAPI objLeagueDao;
	
	@Autowired
	SportUtilityDaoAPI objSportUtilityDao;

	@Override
	public List<League> fetchLeagues(String sport,String comparator) {
		// TODO Auto-generated method stub
		
		List<League> listOfLeagues = new ArrayList<League>();
		String sportId;
		if(comparator.equals("searchText")) {
			listOfLeagues = objLeagueDao.fetchLikeLeagues(sport);
			System.out.println(sport);
			return listOfLeagues;
		}
		if (sport.equals("CRICKET")) {
			sportId=objSportUtilityDao.getsportID("CRICKET");
		}
		else {sportId=objSportUtilityDao.getsportID("SOCCER");}
		
		listOfLeagues = objLeagueDao.fetchLeagues(sportId);
		
		return listOfLeagues;
	}



}
