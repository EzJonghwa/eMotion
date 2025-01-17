package com.eMotion.team.routine.service;

import java.util.ArrayList;

import com.eMotion.team.routine.vo.ElecCarInfoVO;
import com.eMotion.team.routine.vo.ElecPriceVO;
import com.eMotion.team.routine.vo.GasCarInfoVO;
import com.eMotion.team.routine.vo.OilPriceEndVO;
import com.eMotion.team.routine.vo.OilPriceVO;
import com.eMotion.team.routine.vo.RoutineVO;
import com.eMotion.team.routine.vo.maxDataVO;
import com.eMotion.team.routine.vo.stationListVO;

public interface IRoutineService {

	//루틴가져오기
		public ArrayList<RoutineVO> getRoutineList(RoutineVO Routine) throws Exception;
		// 루틴 상세내용 가져오기 
	    public RoutineVO getRoutine(int routineNo) throws Exception;
	    // 바교를 위한 최대값 가져오기
	    public maxDataVO getMaxList();
	    // 충전소 리스트
	    public ArrayList<stationListVO> getStationList(stationListVO stationList) throws Exception;
	    //연료(출발시)
	    public ArrayList<OilPriceVO> getOilPirceList(ArrayList<RoutineVO> routineList) throws Exception;
	    //연료(도착시)
	    public ArrayList<OilPriceEndVO> getOilPirceEndList(ArrayList<RoutineVO> routineList) throws Exception;
	    //연료
	    public ElecPriceVO getElecPriceList();
	    // 루틴 작성 
	    public void writeRoutine(RoutineVO Routine) throws Exception;
	    // 루틴 수정
	    public void RewriteRoutine(RoutineVO Routine) throws Exception;
	    // 루틴 삭제
	    public void deleteRoutine(String email, String routineNo);
		
	    // 내연기관 자동차  가져어기
	    public ArrayList<GasCarInfoVO> getGascarList(ArrayList<RoutineVO> routineList) throws Exception;
	    
	    // 전기 자동차  가져오기
	    public ArrayList<ElecCarInfoVO> getEleccarList(ArrayList<RoutineVO> routineList) throws Exception;
	    
//	    
//	    public ArrayList<OilPriceVO> getOilPirceList(ArrayList<RoutineVO> routineList) throws Exception;
	   
}
