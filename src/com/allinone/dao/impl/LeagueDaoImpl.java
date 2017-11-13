package com.allinone.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
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
import com.allinone.pojos.UserTeam;

@Repository
public class LeagueDaoImpl implements LeagueDaoAPI {

	@Autowired
	private SessionFactory objSessionFactory;
	
	@Override
	public List<League> fetchLeagues(String sportId) {
		// TODO Auto-generated method stub
		
		try {
		Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(League.class);
		Criterion isSystemLeagueCriteria = Restrictions.eq("isSystemLeague", Boolean.TRUE);
		
		objCriteria.add(Restrictions.and(isSystemLeagueCriteria));
		
		List<League> listOfLeagues = new ArrayList<League>();
		List<League> finalList = new ArrayList<League>();
		
		listOfLeagues = objCriteria.list();
		for(int i=0;i<listOfLeagues.size();i++) {
			
			if(listOfLeagues.get(i).getSport().getId().equals(sportId)) {
				finalList.add(listOfLeagues.get(i));
			}
		}
		
		return finalList;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	
	
	@Override
	public List<League> fetchLikeLeagues(String likeLeague) {
		// TODO Auto-generated method stub
		System.out.println(likeLeague+"  Like League at dao");
		Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(League.class);
		Criterion likeLeagueCriteria = Restrictions.ilike("leagueName", "%"+likeLeague.toUpperCase()+"%");
		Criterion likeIdCriteria = Restrictions.ilike("id", "%"+likeLeague.toUpperCase()+"%");
		objCriteria.add(Restrictions.or(likeLeagueCriteria,likeIdCriteria));
		List<League> listOfLeagues = new ArrayList<League>();
		listOfLeagues = objCriteria.list();
		
		
		return listOfLeagues;
	}

	@Override
	public Set<Player> userTeamSet(String leagueId,String userId) {
		// TODO Auto-generated method stub
		
		Session session = objSessionFactory.getCurrentSession();
		League objLeague = session.get(League.class, leagueId);
		Set<UserTeam> userTeams = objLeague.getSetOfUserTeams();
		
		for(UserTeam usrTeam : userTeams) {
			if(usrTeam.getUsert().getUserId().equalsIgnoreCase(userId)) {
				return usrTeam.getSetOfPlayers();
			}
		}
		return null;
	}
	
	@Override
	public Set<UserTeam> fetchUserTeams(String leagueId) {
		// TODO Auto-generated method stub
		
		Session session = objSessionFactory.getCurrentSession();
		League objLeague = session.get(League.class, leagueId);
		Set<UserTeam> userTeams = objLeague.getSetOfUserTeams();
		
		
		return userTeams;
	}


	@Override
	public boolean hasUserJoinedLeague(String userId, String leagueId) {
		// TODO Auto-generated method stub
		Session session = objSessionFactory.getCurrentSession();
		User objUser = session.get(User.class,userId);
		
		if(objUser==null)
			return false;
		
		League objLeague = session.get(League.class, leagueId);
	
			Set<UserTeam> userTeams = objLeague.getSetOfUserTeams();
			for(UserTeam usrTeam : userTeams) {
				if(usrTeam.getUsert().getUserId().equalsIgnoreCase(userId)) {
					return true;
				}
			}
		
		return false;
	}
	

}
