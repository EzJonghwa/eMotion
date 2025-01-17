package com.eMotion.team.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eMotion.team.map.dao.ServiceCenterDAO;

import com.eMotion.team.map.vo.ServiceCenterVO;

@Service("ServiceCenterService")
public class ServiceCenterServiceImpl implements ServiceCenterService {
	
	@Autowired
	ServiceCenterDAO dao;
	
	@Override
	public List<ServiceCenterVO> getServiceCenter()
	{
		 return dao.getServiceCenter();
	}
	
}
