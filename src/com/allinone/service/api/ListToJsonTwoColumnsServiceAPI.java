package com.allinone.service.api;

import java.util.List;

import com.allinone.pojos.League;

public interface ListToJsonTwoColumnsServiceAPI {
	public String listToJson(String rootName , List<League> returnMessage);
}
