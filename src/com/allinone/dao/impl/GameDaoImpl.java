package com.allinone.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.allinone.dao.api.GameDaoAPI;
import com.allinone.pojos.Game;

public class GameDaoImpl implements GameDaoAPI{

	
	@Autowired
	private SessionFactory objSessionFactory;
	
	@Override
	public Game fetchGameObject(String gameId) {
		// TODO Auto-generated method stub
		
		Session session = objSessionFactory.getCurrentSession();
		Game objGame = session.get(Game.class, gameId);
		
		
		return objGame;
	}
}
