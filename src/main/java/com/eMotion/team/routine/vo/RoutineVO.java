package com.eMotion.team.routine.vo;

import lombok.Data;

@Data
public class RoutineVO {
	private int routineNo;
	private String email;
	private String rouTitle;
	private String rouDetail;
	private int rouDay;
	private String startLoc;
	private String endLoc;
	//비교를 위한 지역 추출
	private String startRegion;
	private String endRegion;
	//비교를 위한 지역 추출
	private double totalDis;
	private String roundTripYn;
	private String gasCar;
	private String eleCar;
	private String useYn;
	private String createDt;

}
