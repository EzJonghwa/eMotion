package com.eMotion.team.compare.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eMotion.team.compare.dao.ICarCompareDAO;
import com.eMotion.team.compare.vo.CarElecCompareVO;
import com.eMotion.team.compare.vo.CarGasCompareVO;

@Service("CarCompareService")
public class CarCompareServiceImpl implements CarCompareService{
	
	@Autowired
	ICarCompareDAO dao;
	
	// 전기차 조회 리스트
	@Override
	public ArrayList<CarElecCompareVO> elecCompareList(CarElecCompareVO compare) {
		
		return dao.elecCompareList(compare);
	}
	
	// 전기차 비교용 조회
	@Override
	public CarElecCompareVO getElecCar(CarElecCompareVO compare) throws Exception {
		
		CarElecCompareVO user = dao.getElecCar(compare);
		
		if(user == null) {
			throw new Exception();
		}
		
		return user;
	}
	
	// 내연기관차 조회 리스트
	@Override
	public ArrayList<CarGasCompareVO> gasCompareList(CarGasCompareVO compare) {
		
		return dao.gasCompareList(compare);
	}
	
	// 내연기관차 비교용 조회
	@Override
	public CarGasCompareVO getGasCar(CarGasCompareVO compare) throws Exception {
		
		CarGasCompareVO user = dao.getGasCar(compare);
		
		if(user == null) {
			throw new Exception();
		}
		
		return user;
	}
	
	// 저장 전기차 리스트
	@Override
	public ArrayList<CarElecCompareVO> saveECar(CarElecCompareVO compare){
		
		return dao.saveECar(compare);
	}
	
	// 저장 전기차 리스트
	@Override
	public ArrayList<CarElecCompareVO> likeECar(CarElecCompareVO compare){
		
		return dao.likeECar(compare);
	}
	
	// 저장 전기차 리스트
	@Override
	public ArrayList<CarGasCompareVO> saveGCar(CarGasCompareVO compare){
		
		return dao.saveGCar(compare);
	}
	
	
	
}
