/**
 * 
 */
package com.allinone.pojos;

import java.io.Serializable;

import com.allinone.constants.Operators;
import com.allinone.constants.ScoringRatio;

/**
 * @author rahul
 *
 */
public class RuleHelper implements Serializable, Comparable<RuleHelper> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Operators operator;
	private double score;
	private double points;
	private ScoringRatio scoringRatio;
	
	public RuleHelper() {
		
	}
	
	public RuleHelper(Operators operator, double score, double points) {
		super();
		this.operator = operator;
		this.score = score;
		this.points = points;
	}
	
	public Operators getOperator() {
		return operator;
	}
	public void setOperator(Operators operator) {
		this.operator = operator;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public double getPoints() {
		return points;
	}
	public void setPoints(double points) {
		this.points = points;
	}

	@Override
	public String toString() {
		return "RuleHelper [operator=" + operator + ", score=" + score + ", points=" + points + "]";
	}

	@Override
	public int compareTo(RuleHelper ruleHelper) {
		// TODO Auto-generated method stub
		if(score == ruleHelper.score)  
			return 0;  
		else if(score > ruleHelper.score)  
			return -1;  
		else  
			return 1;  
	}

	public ScoringRatio getScoringRatio() {
		return scoringRatio;
	}

	public void setScoringRatio(ScoringRatio scoringRatio) {
		this.scoringRatio = scoringRatio;
	}



	
}
