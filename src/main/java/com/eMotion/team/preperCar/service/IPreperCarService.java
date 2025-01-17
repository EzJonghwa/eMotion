package com.eMotion.team.preperCar.service;

import java.util.ArrayList;

import com.eMotion.team.preperCar.vo.PreperCarVO;
import com.eMotion.team.recommend.vo.SearchVO;

public interface IPreperCarService {

	public void insertPreper(PreperCarVO preperCarVO) throws Exception;
	public void deletePreper(PreperCarVO preperCarVO) throws Exception;
	public ArrayList<PreperCarVO> preperList(PreperCarVO preperCarVO) throws Exception;
	public ArrayList<PreperCarVO> AllAboutPreperCar(String email);
	public ArrayList<PreperCarVO> myPreperList(String email);
	public ArrayList<PreperCarVO> searchCar(SearchVO searchVO);
}
