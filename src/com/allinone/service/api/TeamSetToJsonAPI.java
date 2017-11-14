package com.allinone.service.api;

import java.util.Set;

import com.allinone.pojos.UserTeam;

public interface TeamSetToJsonAPI {

	public String listToJson(String rootName, Set<UserTeam> returnSet);

}
