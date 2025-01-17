package com.eMotion.team.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eMotion.team.map.dao.ChargingStationDAO;

import com.eMotion.team.map.vo.ChargingStationVO;

@Service("ChargingStationService")
public class ChargingStationServiceImpl implements ChargingStationService{

	@Autowired
	ChargingStationDAO dao;
	
	@Override
	public List<ChargingStationVO> getChargingStation()
	{
		return dao.getChargingStation();
	}
}

