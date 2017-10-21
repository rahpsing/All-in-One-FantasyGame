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

	@Override
	public List<League> fetchLeagues() {
		// TODO Auto-generated method stub
		List<League> listOfLeagues = new ArrayList<League>();
		
		listOfLeagues = objLeagueDao.fetchLeagues();
		
		return listOfLeagues;
	}

	@Override
	public List<League> fetchLikeLeagues(String LikeLeague) {
		// TODO Auto-generated method stub
		
		//for search functionality
		List<League> listOfLeagues = new ArrayList<League>();
		
		listOfLeagues = objLeagueDao.fetchLikeLeagues(LikeLeague);
		
		return listOfLeagues;
	}

	
	

}
