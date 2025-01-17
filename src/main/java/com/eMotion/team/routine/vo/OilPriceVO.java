package com.eMotion.team.routine.vo;

import lombok.Data;

@Data
public class OilPriceVO {
	//routine 과 매칭을 위함
	private int routineNo;
	//routine 과 매칭을 위함
	private String stdate;
	private String region;
	private double Lpg;
	private double Diesel;
	private double PreGasoline;
	private double RegGasoline;
	

}
