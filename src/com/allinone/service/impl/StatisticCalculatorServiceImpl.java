package com.allinone.service.impl;

import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import com.allinone.constants.Operators;
import com.allinone.constants.ScoringRatio;
import com.allinone.dao.impl.SportUtilityDaoImpl;
import com.allinone.pojos.Player;
import com.allinone.pojos.RuleHelper;
import com.allinone.service.api.StatisticCalculatorServiceAPI;

public class StatisticCalculatorServiceImpl implements StatisticCalculatorServiceAPI {

	@Override
	public double calculateScore(String leagueId, Set<Player> setOfPlayers, Map<String,Map<String, Double>> mapOfPlayerAndRoleScores) {
		// TODO Auto-generated method stub
		Map<String,Map<String,Set<RuleHelper>>> mapOfLeagueAndRules = SportUtilityDaoImpl.getMapOfLeagueAndRules();
		if(!mapOfLeagueAndRules.containsKey(leagueId))
			return 0;
		else
			return calculatePlayerScore(setOfPlayers,mapOfLeagueAndRules.get(leagueId),mapOfPlayerAndRoleScores);
	}

	private double calculatePlayerScore(Set<Player> setOfPlayers, Map<String, Set<RuleHelper>> mapOfRolesAndRules, Map<String, Map<String, Double>> mapOfPlayerAndRoleScores) {
		// TODO Auto-generated method stub
		double playerScore = 0;
		double totalScore = 0;
		
		for(Player objPlayer : setOfPlayers) {
			playerScore = 0;
			if(mapOfPlayerAndRoleScores.containsKey(objPlayer.getId())) {
				Map<String,Double> mapRolesAndScores = mapOfPlayerAndRoleScores.get(objPlayer.getId());
			for(String key : mapOfRolesAndRules.keySet()) {
				Set<RuleHelper> objTreeSet = new TreeSet<RuleHelper>(mapOfRolesAndRules.get(key));
				for(RuleHelper objHelper : objTreeSet) {
				
				
					playerScore += getConditionalScore(mapRolesAndScores.get(key), objHelper);
			}
		 }
			totalScore += playerScore;
	    }
		}
			
		return totalScore;
	}
	
	private double getConditionalScore(double playerData, RuleHelper objHelper) {
		
		Operators operator = objHelper.getOperator();
		double score = 0;
		
		switch(operator) {
			
		  case EQUALS:
			  
			  score = objHelper.getScore() == playerData ? objHelper.getPoints() :0;
			  break;
			  
		  case GREATER_THAN:
			   
			//  objHelper.getScoringRatio()	
			  if(playerData > objHelper.getScore())
				  score = calculateScoringRatioBasedScore(playerData, objHelper);
			  
			   break;
			   
		  case LESS_THAN:
			  
			  if(playerData < objHelper.getScore())
				  score = calculateScoringRatioBasedScore(playerData, objHelper);
			   break;
			   
		}
		
		return score;
	}
	
	private double calculateScoringRatioBasedScore(double playerData, RuleHelper objHelper) {
		
		double score = 0;
		
		ScoringRatio objRatio = objHelper.getScoringRatio();
		
		switch(objRatio) {
		
		case TOTAL :
			
			score = objHelper.getPoints();
			break;
			
		case PER_SCORE:
			
			score = (playerData - objHelper.getScore()) * objHelper.getPoints();
			break;
		
		}
		
		return score;
	}

}
