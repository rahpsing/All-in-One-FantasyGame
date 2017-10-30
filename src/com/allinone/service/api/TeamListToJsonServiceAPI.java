package com.allinone.service.api;

import java.util.List;

import com.allinone.pojos.Player;

public interface TeamListToJsonServiceAPI {
	public String listToJson(String rootName , List<Player> returnMessage);
}
