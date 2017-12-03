/**
 * 
 */
package com.allinone.dao.api;

import java.util.List;
import java.util.Set;

import com.allinone.pojos.League;
import com.allinone.pojos.UserTeam;

/**
 * @author rahul
 *
 */
public interface UserTeamDraftDaoAPI {

	public String updateTeam(Set<String> setOfPlayerIds, String leagueId, String userId, String userTeamId,
			int numSubstitutesLeft, double score);

	public boolean updateTeamName(String leagueId, String userId, String userTeamId, String teamName);

	public String createTeam(String leagueId, String userId,String teamName);

	public String getUserTeamId(String leagueId, String UserId);

	public String getUserTeamName(String leagueId, String userId);

	public UserTeam getUserTeamDetails(String userTeamId);

	

}
