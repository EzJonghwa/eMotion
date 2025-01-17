package com.eMotion.team.routine.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MaximizeAction;

import org.apache.ibatis.annotations.Mapper;

import com.eMotion.team.routine.vo.ElecCarInfoVO;
import com.eMotion.team.routine.vo.ElecPriceVO;
import com.eMotion.team.routine.vo.GasCarInfoVO;
import com.eMotion.team.routine.vo.OilPriceEndVO;
import com.eMotion.team.routine.vo.OilPriceVO;
import com.eMotion.team.routine.vo.RoutineVO;
import com.eMotion.team.routine.vo.maxDataVO;
import com.eMotion.team.routine.vo.stationListVO;


@Mapper
public interface IRoutineDAO {
	//루틴가져오기
	public ArrayList<RoutineVO> getRoutineList(RoutineVO Routine);
	
	// 루틴 상세내용 가져오기 
    public RoutineVO getRoutine(int routineNo);
    // 충전소 리스트 가져오기
    public ArrayList<stationListVO> getStationList(stationListVO stationList);
    
    // 바교를 위한 최대값 가져오기
    public maxDataVO getMaxList();
    
    //연료(출발시)
    public OilPriceVO getOilPirceList(RoutineVO routineVO);
    //연료(도착시)
    public OilPriceEndVO getOilPirceEndList(RoutineVO routineVO);
    //연료
//    public ElecPriceVO getElecPriceList(RoutineVO routineVO);
    public ElecPriceVO getElecPriceList();
    // 루틴 작성 
    public int writeRoutine(RoutineVO Routine);
    
    // 루틴 수정
    public int RewriteRoutine(RoutineVO Routine);
    
    // 루틴 삭제
    public int deleteRoutine(Map<String, Object> params);
    
    // 내연기관 자동차  가져어기
    public GasCarInfoVO getGascarList(RoutineVO routineVO);
    
    // 전기 자동차  가져오기
    public ElecCarInfoVO getEleccarList(RoutineVO routineVO);
    
//    // 내연기관 연로 비용 가져오기
//    public OilPriceVO getOilPirceList(RoutineVO routineVO);
    

}
