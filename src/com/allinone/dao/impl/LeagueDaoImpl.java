package com.allinone.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allinone.dao.api.LeagueDaoAPI;
import com.allinone.pojos.Game;
import com.allinone.pojos.League;
import com.allinone.pojos.Player;
import com.allinone.pojos.User;
import com.allinone.pojos.UserTeam;

@Repository
public class LeagueDaoImpl implements LeagueDaoAPI {

	@Autowired
	private SessionFactory objSessionFactory;
	
	@Override
	public List<League> fetchLeagues(String sportId,String userId) {
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
		
		Set<League> finalSet=new HashSet<League>(finalList);
		User objUser = objSessionFactory.getCurrentSession().get(User.class, userId);
		
		Set<League> setOfUserParticipatingLeagues = objUser.getSetOfLeagues();
		for(League league :setOfUserParticipatingLeagues ) {
			finalSet.add(league);
		}
		finalList.clear();
		finalList.addAll(finalSet);
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
		
		return new HashSet<Player>();
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
	
	@Override
	public Map<String,Integer> rulesMap(String leagueId){
		Session session = objSessionFactory.getCurrentSession();
		League objLeague = session.get(League.class, leagueId);
		return objLeague.getMapSportConstraints();
	}
	
	@Override
	public String checkIfThereIsParentLeague(String leagueId) {
		try{
			Session session = objSessionFactory.getCurrentSession();
		League objLeague = session.get(League.class, leagueId);
		if(objLeague.getParentLeague().equals(null)) {
		return "false";
		}
		else {
			return objLeague.getParentLeague(); 
		}
		}
		catch(Exception e) {
			System.out.println(e);
			return "false";
			
		}
	}


	@Override
	public boolean saveUserScores(String leagueId, Map<String, Double> mapOfUserIdAndScore) {
		// TODO Auto-generated method stub
		Session session = objSessionFactory.getCurrentSession();
		
		
		
		League objLeague = session.get(League.class, leagueId);
		Set<UserTeam> userTeams = objLeague.getSetOfUserTeams();
		double totalScore = 0;
		for(UserTeam userTeam : userTeams) {
			
		    String userId = userTeam.getUsert().getUserId();
			if(mapOfUserIdAndScore.containsKey(userId)) {
				
				//computation to add new scores to existing scores
				totalScore = userTeam.getScore() + mapOfUserIdAndScore.get(userId);
				userTeam.setScore(totalScore);
			    session.saveOrUpdate(userTeam);
	        }
	    }
		
		return true;
	}
	
	@Override
	public Set<Game> gamesList(String leagueId){
		Session session = objSessionFactory.getCurrentSession();
		League objLeague = session.get(League.class, leagueId);
		return objLeague.getSetOfGames();
		
	}
	
	@Override
	public League fetchLeague(String leagueId){
		Session session = objSessionFactory.getCurrentSession();
		League objLeague = session.get(League.class, leagueId);
		return objLeague;
		
	}
	
	@Override
	public String checkIfUserIsAdmin(String leagueId,String userId){
		try{
			Session session = objSessionFactory.getCurrentSession();
		
		League objLeague = session.get(League.class, leagueId);
		if(!objLeague.getLeagueOwner().getUserId().equals(null) && objLeague.getLeagueOwner().getUserId().equals(userId))
			return "true";
		
		return "false";
		}
		catch(Exception e)
		{
			System.out.println(e);
			return "false";
		}
	}

	@Override
	public List<League> fetchAvailableLeagueNames(String sportId) {
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
}
