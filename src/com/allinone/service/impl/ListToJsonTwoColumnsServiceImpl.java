package com.allinone.service.impl;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allinone.pojos.League;
import com.allinone.service.api.ListToJsonTwoColumnsServiceAPI;
@Transactional
@Service
public class ListToJsonTwoColumnsServiceImpl implements ListToJsonTwoColumnsServiceAPI {

	@Override
	public String listToJson(String rootName, List<League> returnMessage) {
		JSONArray allData = new JSONArray();
		for(int i=0;i<returnMessage.size();i++) {
			JSONObject eachData = new JSONObject();
            try {
                eachData.put("League", returnMessage.get(i).getLeagueName());
                eachData.put("id", returnMessage.get(i).getId());
                eachData.put("numOfPlayers", returnMessage.get(i).getSetOfUserTeams().size());
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
