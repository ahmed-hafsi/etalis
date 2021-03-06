/**
 * 
 */
package com.jtalis.storm.zstream.agent;

import com.jtalis.storm.zstream.channel.IChannel;

/**
 * This is an agent that detects when an event (from left-child-buffer) 
 * "meets" another event (from right-child-buffer) according to the 
 * Allen's Interval Algebra.
 * The agent is implemented as an {AbstractSequenceOperator} agent where 
 * the time constraint is different (see the method: evaluateTimeConstraint).
 * 
 * @author darko
 *
 */
public class Meets extends AbstractSequenceOperator {

	public Meets(IChannel outChannel, long timeWindow) {
		super(outChannel, timeWindow);
	}
	
	@Override
	protected boolean evaluateTimeConstraint(
			long leftEventStarts, long leftEventEnds, 
			long rightEventStarts, long rightEventEnds) {
		
		if (leftEventEnds == rightEventStarts){
			return true;
		}else{
			return false;
		}
	}
}
