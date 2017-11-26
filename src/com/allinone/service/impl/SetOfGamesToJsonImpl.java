package com.allinone.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.allinone.pojos.Game;
import com.allinone.pojos.UserTeam;

@Service
public class SetOfGamesToJsonImpl implements SetOfGamesToJsonAPI {
	
	@Override
	public String convertSetOfGamesToJson(String rootName, Set<Game> setOfGames) {
		JSONArray allData = new JSONArray();
		List<Game> listOfGames= new ArrayList<Game>(setOfGames);
		for(int i=0;i<listOfGames.size();i++) {
			JSONObject eachData = new JSONObject();
            try {
                eachData.put("homeTeam", listOfGames.get(i).getHomeTeam().getTeamInitials());
                eachData.put("awayTeam", listOfGames.get(i).getAwayTeam().getTeamInitials());
                eachData.put("startTime", listOfGames.get(i).getScheduledStartTime());
            } catch (JSONException e) {
                e.printStackTrace();
            }
            allData.put(eachData);
		}
		JSONObject root = new JSONObject();
	    try {
	        root.put(rootName, allData);
	    } catch (JSONException e) {
	        e.printStackTrace();
	    }
	    return root.toString();	
	}
}
