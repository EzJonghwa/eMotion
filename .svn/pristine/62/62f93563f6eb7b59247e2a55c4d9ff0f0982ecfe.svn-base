package com.eMotion.team.recommend.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eMotion.team.recommend.dao.IFilterDAO;
import com.eMotion.team.recommend.vo.FilterVO;
import com.eMotion.team.recommend.vo.SearchVO;


@Service
public class FilterServiceImpl implements IFilterService{
	
	@Autowired
	IFilterDAO dao;
	
	@Override
	public ArrayList<FilterVO> getPassengerCate(){
		ArrayList<FilterVO> passCateList = dao.getPassengerCate();
		return passCateList;
	}
	@Override
	public ArrayList<FilterVO> getFreightCate(){
		ArrayList<FilterVO> freiCateList = dao.getFreightCate();
		return freiCateList;
	}
	@Override
	public ArrayList<FilterVO> getVansCate(){
		ArrayList<FilterVO> vansCateList = dao.getVansCate();
		return vansCateList;
	}
	@Override
	public ArrayList<FilterVO> getMotorsCate(){
		ArrayList<FilterVO> motoCateList = dao.getMotorsCate();
		return motoCateList;
	}
//	@Override
//	public ArrayList<FilterVO> getCarBrand(SearchVO searchVO){
//		ArrayList<FilterVO> carBrandList = dao.getCarBrand(searchVO);
//		return carBrandList;
//	}
	@Override
	public ArrayList<FilterVO> searchCarBrand(String keyword){
		ArrayList<FilterVO> searchedCarBrandList = dao.searchCarBrand(keyword);
		return searchedCarBrandList;
	}
    
}
