package com.eMotion.team.recommend.service;

import java.util.ArrayList;

import com.eMotion.team.recommend.vo.FilterVO;
import com.eMotion.team.recommend.vo.LocalVO;
import com.eMotion.team.recommend.vo.SearchVO;

public interface IFilterService {
	
	public ArrayList<FilterVO> getPassengerCate();
	public ArrayList<FilterVO> getFreightCate();
	public ArrayList<FilterVO> getVansCate();
	public ArrayList<FilterVO> getMotorsCate();
	public ArrayList<FilterVO> searchCarBrand(String keyword);


}
