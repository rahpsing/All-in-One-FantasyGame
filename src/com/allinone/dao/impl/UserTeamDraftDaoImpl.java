package com.allinone.dao.impl;

import java.util.HashSet;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	public boolean updateTeam(Set<String> setOfPlayerIds, String leagueId, String userId, String userTeamId, int numSubstitutesLeft, double score) {
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
		
		userTeam.setSetOfPlayers(setOfUserTeamPlayers);
		userTeam.setNumSubstitutesLeft(numSubstitutesLeft);
		userTeam.setScore(score);
		userTeam.setUser(objUser);
		userTeam.setLeague(objLeague);
		
		session.saveOrUpdate(userTeam);
		
		return true;
	}
	
	@Override
	public boolean createTeam(String leagueId, String userId) {
		// TODO Auto-generated method stub
		
		Session session = objSessionFactory.getCurrentSession();
		User objUser = session.get(User.class,userId);
		League objLeague = session.get(League.class, leagueId);
		UserTeam userTeam = new UserTeam();
	

		
		Set<Player> setOfUserTeamPlayers = new HashSet<Player>();
		
		userTeam.setSetOfPlayers(setOfUserTeamPlayers);
		userTeam.setNumSubstitutesLeft(objLeague.getNumSubstitutesAllowed());
		userTeam.setScore(0);
		userTeam.setUser(objUser);
		userTeam.setLeague(objLeague);
		
		session.saveOrUpdate(userTeam);
		
		return true;
	}
	
	@Override
	public boolean updateTeamName(String leagueId, String userId, String userTeamId, String teamName) {
		// TODO Auto-generated method stub
		
		Session session = objSessionFactory.getCurrentSession();
		User objUser = session.get(User.class,userId);
		League objLeague = session.get(League.class, leagueId);
		UserTeam userTeam = null;
	
			Set<UserTeam> userTeams = objLeague.getSetOfUserTeams();
			for(UserTeam usrTeam : userTeams) {
				if(usrTeam.getId().equalsIgnoreCase(userTeamId)) {
					userTeam = usrTeam;
					break;
				}
			}
		
		Set<Player> setOfUserTeamPlayers = new HashSet<Player>();

		
		userTeam.setSetOfPlayers(setOfUserTeamPlayers);
		userTeam.setUser(objUser);
		userTeam.setTeamName(teamName);
		userTeam.setLeague(objLeague);
		
		session.saveOrUpdate(userTeam);
		
		return true;
	}
	}
