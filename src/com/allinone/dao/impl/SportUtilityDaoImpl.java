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
		/*	Criteria objRolesCriteria = objSessionFactory.getCurrentSession().createCriteria(Sport.class, "sport")
                    .createAlias("sport.setOfRoles", "role",Criteria.INNER_JOIN);
		//	Criteria objRolesCriteria  = objSessionFactory.getCurrentSession().createCriteria(Sport.class);
			Criterion roleNameCriteria = Restrictions.eq("role", "Batsman");
			objRolesCriteria.add(roleNameCriteria);

			List results2 = objRolesCriteria.list();
			if(results == null || results.isEmpty())
				return false;*/
			
			//System.out.println(results2.get(0));
			player.setSport(results.get(0));
			Set roles = new HashSet();
		//	roles.add("Batsman");
			player.setSetOfPrimaryRoles(roles);
			Set playerSet = sport.getSetOfPlayers();
			playerSet.add(player);
			sport.setSetOfPlayers(playerSet);
			objSessionFactory.getCurrentSession().saveOrUpdate(sport);
			objSessionFactory.getCurrentSession().saveOrUpdate(player);
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
	

}
