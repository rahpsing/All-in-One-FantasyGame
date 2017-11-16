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
public class Game implements Serializable,Comparable<Game> {

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
	private League league;
	//----scorecard function/object to be decided upon-------//
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
	public Date getScheduledStartTime() {
		return scheduledStartTime;
	}
	public void setScheduledStartTime(Date scheduledStartTime) {
		this.scheduledStartTime = scheduledStartTime;
	}
	public Date getScheduledendTime() {
		return scheduledendTime;
	}
	public void setScheduledendTime(Date scheduledendTime) {
		this.scheduledendTime = scheduledendTime;
	}
	public Team getHomeTeam() {
		return homeTeam;
	}
	public void setHomeTeam(Team homeTeam) {
		this.homeTeam = homeTeam;
	}
	public Team getAwayTeam() {
		return awayTeam;
	}
	public void setAwayTeam(Team awayTeam) {
		this.awayTeam = awayTeam;
	}
	public GameStatus getGameStatus() {
		return gameStatus;
	}
	public void setGameStatus(GameStatus gameStatus) {
		this.gameStatus = gameStatus;
	}
	public Team getWinningTeam() {
		return winningTeam;
	}
	public void setWinningTeam(Team winningTeam) {
		this.winningTeam = winningTeam;
	}
	@Override
	public String toString() {
		return "Game [id=" + id + ", venue=" + venue + ", scheduledStartTime=" + scheduledStartTime
				+ ", scheduledendTime=" + scheduledendTime + ", homeTeam=" + homeTeam + ", awayTeam=" + awayTeam
				+ ", gameStatus=" + gameStatus + ", winningTeam=" + winningTeam + "]";
	}
	
	@Override
	public int compareTo(Game game) {
		// TODO Auto-generated method stub
		if(scheduledStartTime.equals(game.scheduledStartTime))  
			return 0;  
		else if(scheduledStartTime.after(game.scheduledStartTime))  
			return 1;  
		else  
			return -1;  
	}
	public League getLeague() {
		return league;
	}
	public void setLeague(League league) {
		this.league = league;
	}
   
}
