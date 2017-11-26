package com.allinone.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.allinone.pojos.UserTeam;
import com.allinone.service.api.TeamSetToJsonAPI;

@Transactional
@Service
public class TeamSetToJsonImpl implements TeamSetToJsonAPI {
	
	@Override
	public String listToJson(String rootName, Set<UserTeam>returnSet) {
		JSONArray allData = new JSONArray();
		List<UserTeam> returnList= new ArrayList<UserTeam>(returnSet);
		for(int i=0;i<returnList.size();i++) {
			JSONObject eachData = new JSONObject();
            try {
                eachData.put("userName", returnList.get(i).getUsert().getUserName());
                eachData.put("id", returnList.get(i).getId());
                eachData.put("points", returnList.get(i).getScore());
                eachData.put("userTeamName", returnList.get(i).getTeamName());
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
