package com.allinone.service.impl;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.allinone.pojos.Player;
import com.allinone.service.api.TeamListToJsonServiceAPI;

@Service
public class TeamListToJsonServiceImpl implements TeamListToJsonServiceAPI {

	@Override
	public String listToJson(String rootName, List<Player> returnMessage) {
		// TODO Auto-generated method stub
		JSONArray allData = new JSONArray();
		for(int i=0;i<returnMessage.size();i++) {
			JSONObject eachData = new JSONObject();
            try {
                eachData.put("player", returnMessage.get(i).getFirstName()+" "+returnMessage.get(i).getLastName());
                eachData.put("id", returnMessage.get(i).getId());
                eachData.put("role",returnMessage.get(i).getPlayerRole());
                //eachData.put("setOfTeams", new ArrayList<>(returnMessage.get(i).getSetOfTeams()));
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
