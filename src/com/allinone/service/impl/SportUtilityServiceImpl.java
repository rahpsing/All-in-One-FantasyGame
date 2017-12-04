/**
 * 
 */
package com.allinone.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allinone.dao.api.SportUtilityDaoAPI;
import com.allinone.service.api.SportUtilityServiceAPI;

/**
 * @author rahul
 *
 */
@Transactional
@Service
public class SportUtilityServiceImpl implements SportUtilityServiceAPI {

	@Autowired
	SportUtilityDaoAPI objServiceUtilityDao;

	@Override
	public boolean readEntriesToDatabase() throws Exception {
		// TODO Auto-generated method stub
		
		return objServiceUtilityDao.addEntriesToDatabase();
	}

	@Override
	public boolean addNewSport() {
		// TODO Auto-generated method stub
		
		return objServiceUtilityDao.addNewSportEntry();
	}

	@Override
	public boolean createLeague() {
		// TODO Auto-generated method stub
		return objServiceUtilityDao.createLeague();
	}
	
	@Override
	public String createUserLeague(String leagueName,String leagueId,String userId) {
		// TODO Auto-generated method stub
		String returnString=objServiceUtilityDao.createUserLeague(leagueName, leagueId,userId);
		if(!returnString.equals("false"))
		{
			return returnString;
		}
		else {
			return "false";
		}
	}

}
