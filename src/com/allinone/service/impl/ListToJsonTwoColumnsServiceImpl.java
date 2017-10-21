package com.allinone.service.impl;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.allinone.pojos.League;
import com.allinone.service.api.ListToJsonTwoColumnsServiceAPI;

@Service
public class ListToJsonTwoColumnsServiceImpl implements ListToJsonTwoColumnsServiceAPI {

	@Override
	public String listToJson(String rootName, List<League> returnMessage) {
		JSONArray allData = new JSONArray();
		for(int i=0;i<returnMessage.size();i++) {
			JSONObject eachData = new JSONObject();
            try {
                eachData.put("League", returnMessage.get(i).getLeagueName());
                eachData.put("ID", returnMessage.get(i).getId());
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
