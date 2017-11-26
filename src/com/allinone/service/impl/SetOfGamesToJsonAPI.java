package com.allinone.service.impl;

import java.util.Set;

import com.allinone.pojos.Game;
import com.allinone.pojos.UserTeam;

public interface SetOfGamesToJsonAPI {

	

	public String convertSetOfGamesToJson(String rootName, Set<Game> returnSet);


}
