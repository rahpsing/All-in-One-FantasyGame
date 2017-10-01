/**
 * 
 */
package com.allinone.pojos;

import java.io.Serializable;
import java.util.Date;

import com.allinone.util.GameStatus;

/**
 * @author rahul
 *
 */
public class Game implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String venue;
	private Date scheduledStartTime;
	private Date scheduledendTime;
	private Team homeTeam;
	private Team awayTeam;
	private GameStatus gameStatus;
	private Team winningTeam;
	//----scorecard function/object to be decided upon-------//
	

}
