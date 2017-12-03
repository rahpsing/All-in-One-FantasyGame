/**
 * 
 */
package com.allinone.service.api;

import java.io.IOException;
import java.util.Set;

/**
 * @author rahul
 *
 */
public interface ExcelCreatorServiceAPI {

	public String generateLeagueDataUploadFile(Set<String> setOfMetrics, String sportName) throws IOException;
	
	public String generateGameDataUploadFile(String leagueId, String gameId) throws IOException;
	
}
