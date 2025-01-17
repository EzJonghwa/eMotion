package com.eMotion.team.recommend.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.eMotion.team.recommend.vo.LocalVO;
import com.eMotion.team.recommend.vo.RecommendVO;
import com.eMotion.team.recommend.vo.SearchVO;

@Mapper
public interface IRecommendDAO {
	
	public ArrayList<RecommendVO> getFilteredList(SearchVO searchVO);
	public int getCount(SearchVO searchVO);
	public ArrayList<LocalVO> getFirstLocal();
	public ArrayList<LocalVO> getSecondLocal(String addr);
	public ArrayList<LocalVO> getSelectedLocInfo(LocalVO localVO);
	
	
}
