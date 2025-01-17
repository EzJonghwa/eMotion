package com.eMotion.team.chart.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eMotion.team.chart.dao.IChartDAO;
import com.eMotion.team.chart.vo.ChartVO;

@Service
public class ChartServiceImpl implements IChartService {

	@Autowired
	IChartDAO dao;
	@Override
	public ArrayList<ChartVO> getChartData(ChartVO chartVO){
		
		ArrayList<ChartVO> chartData = dao.getChartData(chartVO);
		
		return chartData;
		
	}
}
