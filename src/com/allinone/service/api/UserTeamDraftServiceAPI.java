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

	public String updateTeam(Set<String> setOfPlayerIds, String leagueId, String userId, String userTeamId,
			int numSubstitutesLeft, double score);

	public boolean updateTeamName(String leagueId, String userId, String userTeamId, String teamName);

	

	public String createTeam(Set<String> setOfPlayerIds, String leagueId, String userId);

	public String getUserTeamId(String leagueId, String UserId);

	public String getUserTeamName(String leagueId, String userId);

	

}
