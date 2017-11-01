/**
 * 
 */
package com.allinone.service.api;

import java.util.Set;

/**
 * @author rahul
 *
 */
public interface UserTeamDraftServiceAPI {

	public boolean updateTeam(Set<String> setOfPlayerIds, String leagueId, String userId, String userTeamId,
			int numSubstitutesLeft, double score);

	public boolean updateTeamName(String leagueId, String userId, String userTeamId, String teamName);

	public boolean createTeam(String leagueId, String userId);

	

}
