package com.allinone.service.impl;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.allinone.pojos.UserTeam;
import com.allinone.service.api.TeamDetailsJsonConverterAPI;

@Service
public class TeamDetailsJsonConverterImpl implements TeamDetailsJsonConverterAPI {
	@Override
	public String teamDetailsJsonConverter(String rootName, UserTeam usrtm) {
		JSONArray allData = new JSONArray();
		JSONObject eachData = new JSONObject();
		  try {
			eachData.put("scores", usrtm.getScore());
			 eachData.put("swaps", usrtm.getNumSubstitutesLeft());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  allData.put(eachData);
		  
		  JSONObject root = new JSONObject();
		    try {
		        root.put(rootName, allData);
		    } catch (JSONException e) {
		        e.printStackTrace();
		    }
		    return root.toString();	
	}
	
}
