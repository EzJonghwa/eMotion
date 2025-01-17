package com.eMotion.team.routine.vo;

import lombok.Data;

@Data
public class OilPriceEndVO {
	//routine 과 매칭을 위함
	private int routineNo;
	//routine 과 매칭을 위함
		
	private String stdateEnd;
	private String regionEnd;
	private double LpgEnd;
	private double DieselEnd;
	private double PregasolineEnd;
	private double ReggasolineEnd;
}
