package com.allinone.service.api;

import org.springframework.stereotype.Service;

import com.allinone.pojos.UserTeam;

@Service
public interface TeamDetailsJsonConverterAPI {

	
	public String teamDetailsJsonConverter(String rootName,UserTeam usrtm);
	
}
