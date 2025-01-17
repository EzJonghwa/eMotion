package com.eMotion.team.preperCar.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eMotion.team.preperCar.dao.IPreperCarDAO;
import com.eMotion.team.preperCar.vo.PreperCarVO;
import com.eMotion.team.recommend.vo.SearchVO;

@Service
public class PreperCarServiceImpl implements IPreperCarService{

	@Autowired
	IPreperCarDAO dao;
	
	@Override
	public void insertPreper(PreperCarVO preperCarVO) throws Exception {
		int result = dao.insertPreper(preperCarVO);
   	 if (result == 0) {
            throw new Exception("찜목록 추가에 실패했습니다.");
        }
	}
	
	@Override
	public void deletePreper(PreperCarVO preperCarVO) throws Exception {
		int result = dao.deletePreper(preperCarVO);
	   	 if (result == 0) {
	            throw new Exception("찜목록 삭제에 실패했습니다.");
	        }
	}
	
	@Override
	public ArrayList<PreperCarVO> preperList(PreperCarVO preperCarVO) throws Exception {
		ArrayList<PreperCarVO> alreadyPreperList = dao.preperList(preperCarVO);
		
			return alreadyPreperList;
	}
	
	@Override
	public ArrayList<PreperCarVO> myPreperList(String email){
		ArrayList<PreperCarVO> preperCarList = dao.myPreperList(email);
		
		return preperCarList;
	}
	
	@Override
	public ArrayList<PreperCarVO> AllAboutPreperCar(String email){
		ArrayList<PreperCarVO> allAboutPreperCar = dao.AllAboutPreperCar(email);
		
		return allAboutPreperCar;
	}
	
	@Override
	public ArrayList<PreperCarVO> searchCar(SearchVO searchVO){
		ArrayList<PreperCarVO> searchedCarList = dao.searchCar(searchVO);
		
		return searchedCarList;
		
	}
}
