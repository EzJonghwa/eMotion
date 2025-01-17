package com.eMotion.team.recommend.service;

import java.util.ArrayList;

import com.eMotion.team.recommend.vo.LocalVO;
import com.eMotion.team.recommend.vo.RecommendVO;
import com.eMotion.team.recommend.vo.SearchVO;

public interface IRecommendService {

	public ArrayList<RecommendVO> getFilteredList(SearchVO searchVO);
	public int getCount(SearchVO searchVO);
	public ArrayList<LocalVO> getFirstLocal();
	public ArrayList<LocalVO> getSecondLocal(String addr);
	public ArrayList<LocalVO> getSelectedLocInfo(LocalVO localVO);

}
