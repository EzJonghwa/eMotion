package com.eMotion.team.compare.service;

import java.util.ArrayList;

import com.eMotion.team.compare.vo.CarElecCompareVO;
import com.eMotion.team.compare.vo.CarGasCompareVO;

public interface CarCompareService {

	// 전기차 조회 리스트
	public ArrayList<CarElecCompareVO> elecCompareList(CarElecCompareVO compare);
	
	// 전기차 비교용 조회
	public CarElecCompareVO getElecCar(CarElecCompareVO compare) throws Exception;
	
	// 내연기관차 조회 리스트
	public ArrayList<CarGasCompareVO> gasCompareList(CarGasCompareVO compare);
	
	// 내연기관차 비교용 조회
	public CarGasCompareVO getGasCar(CarGasCompareVO compare) throws Exception;
	
	// 저장 전기차 리스트
	public ArrayList<CarElecCompareVO> saveECar(CarElecCompareVO compare);
	
	// 찜 전기차 리스트
	public ArrayList<CarElecCompareVO> likeECar(CarElecCompareVO compare);
	
	// 저장 내연기관차 리스트
	public ArrayList<CarGasCompareVO> saveGCar(CarGasCompareVO compare);
	
}
