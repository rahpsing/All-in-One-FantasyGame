package com.allinone.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.allinone.dao.api.SportUtilityDaoAPI;
import com.allinone.pojos.League;
import com.allinone.pojos.Player;
import com.allinone.pojos.Sport;
import com.allinone.pojos.User;

@Repository
public class SportUtilityDaoImpl implements SportUtilityDaoAPI {

	@Autowired
	private SessionFactory objSessionFactory;

	@Override
	public boolean addEntriesToDatabase() {
		// TODO Auto-generated method stub
		//code to add player
		
		//retrieve sport_roles and check if roles exists in that object
		
		try {
			
		    Player player = new Player();
			player.setFirstName("Virat");
			player.setLastName("Kohli");
			

			Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(Sport.class);
			Criterion usernameCriteria = Restrictions.eq("sportName", "Cricket");
			objCriteria.add(usernameCriteria);

			List<Sport> results = objCriteria.list();
			
			if(results == null || results.isEmpty())
				return false;
			
			Sport sport = results.get(0);
			Set setOfRoles = sport.getSetOfRoles();
			
			System.out.println(results.get(0));

			player.setSport(sport);
			Set roles = new HashSet();

			player.setSetOfPrimaryRoles(roles);
			Set playerSet = sport.getSetOfPlayers();
			playerSet.add(player);
			sport.setSetOfPlayers(playerSet);
			objSessionFactory.getCurrentSession().saveOrUpdate(sport);
			objSessionFactory.getCurrentSession().saveOrUpdate(player);
	/*		Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(Sport.class);
			Criterion usernameCriteria = Restrictions.eq("sportName", "Cricket");
			objCriteria.add(usernameCriteria);

			List<Sport> results = objCriteria.list();
			
			if(results == null || results.isEmpty())
				return false;
			
			Sport sport = results.get(0);*/
			
			objSessionFactory.getCurrentSession().saveOrUpdate(player);
			//objSessionFactory.getCurrentSession().saveOrUpdate(sport);
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}
	
	@Override
	public boolean addNewSportEntry() {
		
		try {
			Sport sport = new Sport();
			sport.setSportName("Cricket");
			Set<String> setOfRoles = new HashSet<String>();
			setOfRoles.add("Bowler");
			setOfRoles.add("Batsman");
			setOfRoles.add("WicketKeeper");
			sport.setSetOfRoles(setOfRoles);
			
			sport.setSetOfLeagues(new HashSet<League>());
			sport.setSetOfPlayers(new HashSet<Player>());
			objSessionFactory.getCurrentSession().saveOrUpdate(sport);
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}

	@Override
	public boolean createLeague() {
		// TODO Auto-generated method stub

		try {
			
			League league = new League();
			league.setLeagueName("IPL");
			league.setSystemLeague(true);
			
			League league2 = new League();
			league2.setLeagueName("PSL");
			league2.setSystemLeague(true);
			
			
			League league3 = new League();
			league3.setLeagueName("Australian Summer League");
			league3.setSystemLeague(true);
			
			
			League league4 = new League();
			league4.setLeagueName("Carribean League");
			league4.setSystemLeague(true);
			
			
			League league5 = new League();
			league5.setLeagueName("Westeros League");
			league5.setSystemLeague(true);
			
			
			League league6 = new League();
			league6.setLeagueName("ICC top 11");
			league6.setSystemLeague(true);
			
			
			League league7 = new League();
			league7.setLeagueName("Westeros Champions League");
			league7.setSystemLeague(true);

			Criteria objCriteria  = objSessionFactory.getCurrentSession().createCriteria(Sport.class);
			Criterion usernameCriteria = Restrictions.eq("sportName", "Cricket");
			objCriteria.add(usernameCriteria);

			List<Sport> results = objCriteria.list();
			
			if(results == null || results.isEmpty())
				return false;
			
			Sport sport = results.get(0);
			Set set = new HashSet();
			set.add(league);
			//sport.setSetOfLeagues(set);
			league.setSport(sport);
			league2.setSport(sport);
			league3.setSport(sport);
			league4.setSport(sport);
			league5.setSport(sport);
			league6.setSport(sport);
			league7.setSport(sport);
			objSessionFactory.getCurrentSession().saveOrUpdate(league);
			objSessionFactory.getCurrentSession().saveOrUpdate(league2);
			objSessionFactory.getCurrentSession().saveOrUpdate(league3);
			objSessionFactory.getCurrentSession().saveOrUpdate(league4);
			objSessionFactory.getCurrentSession().saveOrUpdate(league5);
			objSessionFactory.getCurrentSession().saveOrUpdate(league6);
			objSessionFactory.getCurrentSession().saveOrUpdate(league7);
			//objSessionFactory.getCurrentSession().saveOrUpdate(sport);
		} catch(Exception e) {
			System.out.println(e);
			return false;
		}
		
		return true;
	}
	

}
