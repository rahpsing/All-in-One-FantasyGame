package com.allinone.service.api;

import java.util.Map;
import java.util.Set;

import com.allinone.pojos.Player;

public interface StatisticCalculatorServiceAPI {
	
	public double calculateScore(String leagueId, Set<Player> setOfPlayers, Map<String,Map<String, Double>> mapOfPlayerAndRoleScores);

}
