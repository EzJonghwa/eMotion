package com.eMotion.team.recommend.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.eMotion.team.recommend.vo.FilterVO;
import com.eMotion.team.recommend.vo.SearchVO;

@Mapper
public interface IFilterDAO {

	public ArrayList<FilterVO> getPassengerCate();
	public ArrayList<FilterVO> getFreightCate();
	public ArrayList<FilterVO> getVansCate();
	public ArrayList<FilterVO> getMotorsCate();
//	public ArrayList<FilterVO> getCarBrand(SearchVO searchVO);
	public ArrayList<FilterVO> searchCarBrand(String keyword);
}
