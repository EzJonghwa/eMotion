package com.eMotion.team.preperCar.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.eMotion.team.preperCar.vo.PreperCarVO;
import com.eMotion.team.recommend.vo.SearchVO;

@Mapper
public interface IPreperCarDAO {

	public int insertPreper(PreperCarVO preperCarVO);
	public int deletePreper(PreperCarVO preperCarVO);
	public ArrayList<PreperCarVO> preperList(PreperCarVO preperCarVO);
	public ArrayList<PreperCarVO> AllAboutPreperCar(String email);
	//찜리스트 가져오기
	public ArrayList<PreperCarVO> myPreperList(String email);
	public ArrayList<PreperCarVO> searchCar(SearchVO searchVO);
	
}
