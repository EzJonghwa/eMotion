package com.eMotion.team.routine.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eMotion.team.routine.dao.IRoutineDAO;
import com.eMotion.team.routine.vo.ElecCarInfoVO;
import com.eMotion.team.routine.vo.ElecPriceVO;
import com.eMotion.team.routine.vo.GasCarInfoVO;
import com.eMotion.team.routine.vo.OilPriceEndVO;
import com.eMotion.team.routine.vo.OilPriceVO;
import com.eMotion.team.routine.vo.RoutineVO;
import com.eMotion.team.routine.vo.maxDataVO;
import com.eMotion.team.routine.vo.stationListVO;

@Service
public class IRoutineServiceImpl implements IRoutineService{

	@Autowired
	IRoutineDAO dao;
	//루틴가져오기
	
	@Override
	public ArrayList<RoutineVO> getRoutineList(RoutineVO routine) throws Exception {
	    // 루틴 목록 조회
	    ArrayList<RoutineVO> result = dao.getRoutineList(routine);
	    return result;
	}
		
		
		
		// 루틴 상세내용 가져오기 
		@Override
	    public RoutineVO getRoutine(int routineNo) throws Exception{
	    	RoutineVO result = dao.getRoutine(routineNo);
	         if (result == null) {
	             throw new Exception("작성된 루틴을 찾을수 없습니다.");
	         }
	         return result;
	    }
	    
	    
	    // 루틴 작성 
		@Override
	    public void writeRoutine(RoutineVO Routine) throws Exception{
	    	int result = dao.writeRoutine(Routine);
	    	 if (result == 0) {
	             throw new Exception("루틴 작성에 실패했습니다.");
	         }
	    }
	    
	    // 루틴 수정
		@Override
	    public void RewriteRoutine(RoutineVO Routine) throws Exception{
	    	int result = dao.RewriteRoutine(Routine);
	    	if(result == 0) {
	    		throw new Exception("루틴 수정에 실패했습니다");
	    	}
	    }
		@Override
		public void deleteRoutine(String email, String routineNo){
			  try {
		            // routineNo를 숫자로 변환
		            int routineNoParsed = Integer.parseInt(routineNo);

		            // 파라미터 맵 생성
		            Map<String, Object> params = new HashMap<>();
		            params.put("email", email);
		            params.put("routineNo", routineNoParsed);

		            // DAO 호출
		            dao.deleteRoutine(params);

		        } catch (NumberFormatException e) {
		            throw new IllegalArgumentException("routineNo는 유효한 숫자여야 합니다: " + routineNo, e);
		        }
			
		}; 	

			
		// 충전소 리스트
		@Override
	    public ArrayList<stationListVO> getStationList(stationListVO stationList ) throws Exception{
	    	 ArrayList<stationListVO> result = dao.getStationList(stationList);
	 	    return result;
	    };
	    
		@Override
	    public ArrayList<GasCarInfoVO> getGascarList(ArrayList<RoutineVO> routineList) throws Exception{
			ArrayList<GasCarInfoVO> getGascarList = new ArrayList<GasCarInfoVO>();
			for(int i = 0; i < routineList.size(); i ++) {
				getGascarList.add(dao.getGascarList(routineList.get(i)));
			}
			return getGascarList;
	    };
	    
	    // 전기 자동차  가져오기
		@Override
	    public ArrayList<ElecCarInfoVO> getEleccarList(ArrayList<RoutineVO> routineList) throws Exception{
	    	ArrayList<ElecCarInfoVO> getEleccarList =  new ArrayList<ElecCarInfoVO>(); 
	    	for(int i = 0; i < routineList.size(); i ++) {
	    		getEleccarList.add(dao.getEleccarList(routineList.get(i)));
			}
			return getEleccarList;
	    }

		 // 바교를 위한 최대값 가져오기
		 @Override
		 public maxDataVO getMaxList() {
			return dao.getMaxList();
	    };

	    //연료(출발시)
	    @Override
	    public ArrayList<OilPriceVO> getOilPirceList(ArrayList<RoutineVO> routineList) throws Exception{
	    	ArrayList<OilPriceVO> getOilPirceList = new ArrayList<OilPriceVO>();
	    	for(int i = 0; i < routineList.size(); i ++) {
	    		getOilPirceList.add(dao.getOilPirceList(routineList.get(i)));
			}
			return getOilPirceList;
			};
			
	    //연료(도착시)
		@Override
	    public ArrayList<OilPriceEndVO> getOilPirceEndList(ArrayList<RoutineVO> routineList) throws Exception{
	    	ArrayList<OilPriceEndVO> getOilPirceEndList = new ArrayList<OilPriceEndVO>();
	    	for(int i = 0; i < routineList.size(); i ++) {
	    		getOilPirceEndList.add(dao.getOilPirceEndList(routineList.get(i)));
			}
			return getOilPirceEndList;
	    };
	    //연료
	    
	    
	    @Override
	    public ElecPriceVO getElecPriceList() {
	    	return dao.getElecPriceList();
	    };
//	    public ArrayList<ElecPriceVO> getElecPriceList(ArrayList<RoutineVO> routineList) throws Exception{
//	    	ArrayList<ElecPriceVO> getElecPriceList = new ArrayList<ElecPriceVO>();
//	    	for(int i = 0; i < routineList.size(); i ++) {
//	    		getElecPriceList.add(dao.getElecPriceList(routineList.get(i)));
//			}
//			return getElecPriceList;
//	    };
	    
	    // 내연기관 연로 비용 가져오기
//	   
//	    public ArrayList<OilPriceVO> getOilPirceList(ArrayList<RoutineVO> routineList) throws Exception{
//	    	ArrayList<OilPriceVO> getOilPirceList = new ArrayList<OilPriceVO>();
//	    	for (int i =0; i<routineList.size(); i++) {
//	    		getOilPirceList.add(dao.getOilPirceList(routineList.get(i)));
//	    	}
//			return getOilPirceList;
//	    	
//	    }
//	    
	    
}
