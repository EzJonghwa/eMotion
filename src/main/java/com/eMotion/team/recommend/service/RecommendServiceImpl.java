package com.eMotion.team.recommend.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eMotion.team.recommend.dao.IRecommendDAO;
import com.eMotion.team.recommend.vo.LocalVO;
import com.eMotion.team.recommend.vo.RecommendVO;
import com.eMotion.team.recommend.vo.SearchVO;

@Service
public class RecommendServiceImpl implements IRecommendService{

	@Autowired
	IRecommendDAO dao;
	
	@Override
	public ArrayList<RecommendVO> getFilteredList(SearchVO searchVO){
		ArrayList<RecommendVO> filteredList = dao.getFilteredList(searchVO);
		return filteredList;
	}
	@Override
	public int getCount(SearchVO searchVO) {
		int resultCount = dao.getCount(searchVO);
		return resultCount;
	}
	
	@Override
	public ArrayList<LocalVO> getFirstLocal(){
		ArrayList<LocalVO> firstAddrList = dao.getFirstLocal();
		return firstAddrList;
	}

	@Override
	public ArrayList<LocalVO> getSecondLocal(String addr){
		ArrayList<LocalVO> secondAddrList = dao.getSecondLocal(addr);
		return secondAddrList;
	}
	
	@Override
	public ArrayList<LocalVO> getSelectedLocInfo(LocalVO localVO){
		ArrayList<LocalVO> selectedLocInfoList = dao.getSelectedLocInfo(localVO);
		return selectedLocInfoList;
	}
}
