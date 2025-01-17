package com.eMotion.team.compare.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.eMotion.team.compare.vo.CarElecCompareVO;
import com.eMotion.team.compare.vo.CarGasCompareVO;

@Mapper
public interface ICarCompareDAO {
	
	public ArrayList<CarElecCompareVO> elecCompareList(CarElecCompareVO compare);
	
	public CarElecCompareVO getElecCar(CarElecCompareVO compare);
	
	public ArrayList<CarGasCompareVO> gasCompareList(CarGasCompareVO compare);
	
	public CarGasCompareVO getGasCar(CarGasCompareVO compare);
	
	public ArrayList<CarElecCompareVO> saveECar(CarElecCompareVO compare);
	
	public ArrayList<CarElecCompareVO> likeECar(CarElecCompareVO compare);
	
	public ArrayList<CarGasCompareVO> saveGCar(CarGasCompareVO compare);

}
