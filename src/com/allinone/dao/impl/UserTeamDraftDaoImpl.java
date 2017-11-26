package com.allinone.dao.impl;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;


import org.apache.xmlbeans.impl.xb.xsdschema.RestrictionDocument.Restriction;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allinone.dao.api.UserTeamDraftDaoAPI;
import com.allinone.pojos.League;
import com.allinone.pojos.Player;
import com.allinone.pojos.User;
import com.allinone.pojos.UserTeam;

@Repository
public class UserTeamDraftDaoImpl implements UserTeamDraftDaoAPI {

	@Autowired
	private SessionFactory objSessionFactory;

	
	@Override
	public String updateTeam(Set<String> setOfPlayerIds, String leagueId, String userId, String userTeamId, int numSubstitutesLeft, double score) {
		// TODO Auto-generated method stub
		
		Session session = objSessionFactory.getCurrentSession();
		User objUser = session.get(User.class,userId);
		League objLeague = session.get(League.class, leagueId);
		UserTeam userTeam = new UserTeam();
	
			Set<UserTeam> userTeams = objLeague.getSetOfUserTeams();
			for(UserTeam usrTeam : userTeams) {
				if(usrTeam.getId().equalsIgnoreCase(userTeamId)) {
					userTeam = usrTeam;
					break;
				}
			}
		
		Set<Player> setOfUserTeamPlayers = new HashSet<Player>();
		
		for(String playerId : setOfPlayerIds) {
			setOfUserTeamPlayers.add(session.get(Player.class, playerId));
		}
		try {
		userTeam.setSetOfPlayers(setOfUserTeamPlayers);
		userTeam.setNumSubstitutesLeft(numSubstitutesLeft);
		userTeam.setScore(score);
		userTeam.setUsert(objUser);
		userTeam.setLeague(objLeague);
		
		session.saveOrUpdate(userTeam);
		
		return "true";
		}
		catch (Exception e) {
			System.out.println(e);
			return "false";
		}
	}
	
	@Override
	public String createTeam(String leagueId, String userId) {
		// TODO Auto-generated method stub
		
		Session session = objSessionFactory.getCurrentSession();
		User objUser = session.get(User.class,userId);
		League objLeague = session.get(League.class, leagueId);
		UserTeam userTeam = new UserTeam();
	

		
		Set<Player> setOfUserTeamPlayers = new HashSet<Player>();
		
		userTeam.setSetOfPlayers(setOfUserTeamPlayers);
		userTeam.setNumSubstitutesLeft(objLeague.getNumSubstitutesAllowed());
		userTeam.setScore(0);
		userTeam.setUsert(objUser);
		userTeam.setLeague(objLeague);
		
		session.saveOrUpdate(userTeam);
		System.out.println("_______Seperation------------------");
		try {
			
			//Query q = session.createQuery("from USER_TEAM as e join "+"where e.USERT.");
			Query q = session.createQuery("from UserTeam as e where e.league.id = :id and e.usert.userId = :userId");
			q.setParameter("id", leagueId);
			q.setParameter("userId", userId);
			List<UserTeam> results = q.list();
			for (UserTeam userTeam2 : results) {
				System.out.println("Look Here");
				System.out.println(userTeam2.getUsert().toString());
				System.out.println(userTeam2.getLeague().getId());
				return userTeam2.getId();
			}
			
			//Iterator iterator = results.iterator();
			//UserTeam temp=(UserTeam) iterator.next();
			if(results == null || results.isEmpty())
				return "false";
			//System.out.println(temp.getId());
			
			
			} catch(Exception e) {
				System.out.println(e);
				return "false";
			}
		return "false";
		
		}
	
	@Override
	public boolean updateTeamName(String leagueId, String userId, String userTeamId, String teamName) {
		// TODO Auto-generated method stub
		
		Session session = objSessionFactory.getCurrentSession();
		User objUser = session.get(User.class,userId);
		League objLeague = session.get(League.class, leagueId);
		UserTeam objuserTeam = session.get(UserTeam.class, userTeamId);
		UserTeam userTeam = null;
	
			Set<UserTeam> userTeams = objLeague.getSetOfUserTeams();
			for(UserTeam usrTeam : userTeams) {
				if(usrTeam.getId().equalsIgnoreCase(userTeamId)) {
					userTeam = usrTeam;
					break;
				}
			}
		
		Set<Player> setOfUserTeamPlayers = new HashSet<Player>();

		try {
			//objuserTeam.setSetOfPlayers(setOfUserTeamPlayers);
			//objuserTeam.setUsert(objUser);
			objuserTeam.setTeamName(teamName);
			//objuserTeam.setLeague(objLeague);
		
		session.saveOrUpdate(objuserTeam);
		
		return true;
		}
		catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
	@Override
	public String getUserTeamId(String leagueId,String userId) {
		try{
		Session session = objSessionFactory.getCurrentSession();
		Query q = session.createQuery("from UserTeam as e where e.league.id = :id and e.usert.userId = :userId");
		q.setParameter("id", leagueId);
		q.setParameter("userId", userId);
		List<UserTeam> results = q.list();
		for (UserTeam userTeam2 : results) {
			System.out.println("Look Here");
			System.out.println(userTeam2.getUsert().toString());
			System.out.println(userTeam2.getLeague().getId());
			return userTeam2.getId();
		}
		return "No user Team";
	}
		catch (Exception e) {
			System.out.println(e);
			return "No user Team";
		}
	}
	
	@Override
	public String getUserTeamName(String leagueId,String userId) {
		try{
			Session session = objSessionFactory.getCurrentSession();
			Query q = session.createQuery("from UserTeam as e where e.league.id = :id and e.usert.userId = :userId");
			q.setParameter("id", leagueId);
			q.setParameter("userId", userId);
			List<UserTeam> results = q.list();
			for (UserTeam userTeam2 : results) {
				System.out.println("Look Here");
				System.out.println(userTeam2.getUsert().toString());
				System.out.println(userTeam2.getLeague().getId());
				return userTeam2.getTeamName();
			}
			return "Playing Eleven";
		}
			catch (Exception e) {
				System.out.println(e);
				return "Playing Eleven";
			}
	}
	}
