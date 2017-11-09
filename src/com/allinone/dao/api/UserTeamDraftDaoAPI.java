/**
 * 
 */
package com.allinone.dao.api;

import java.util.List;
import java.util.Set;

import com.allinone.pojos.League;

/**
 * @author rahul
 *
 */
public interface UserTeamDraftDaoAPI {

	public boolean updateTeam(Set<String> setOfPlayerIds, String leagueId, String userId, String userTeamId,
			int numSubstitutesLeft, double score);

	public boolean updateTeamName(String leagueId, String userId, String userTeamId, String teamName);

	public String createTeam(String leagueId, String userId);

	

}
