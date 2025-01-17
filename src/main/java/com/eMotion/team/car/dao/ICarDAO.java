package com.eMotion.team.car.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.eMotion.team.car.vo.CarVO;
import com.eMotion.team.member.vo.MemberVO;

@Mapper
public interface ICarDAO {
	
	// 자동완성 리스트 조회
	public ArrayList<CarVO> getCarList(CarVO car);
	
	// 전기차 저장
	public int eSaveCar(CarVO car);
	
	// 내연기관차 저장
	public int gSaveCar(CarVO car);
	
	// 전기차 조회
	public int eCarCheck(CarVO car);
	
	// 내연기관차 조회
	public int gCarCheck(CarVO car);
	
	// 전기차 숫자 조회
	public int eNumCheck(CarVO car);
	
	// 내연기관차 숫자 조회
	public int gNumCheck(CarVO car);
	
	// 내연차 리스트 조회
	public ArrayList<CarVO> gSaveCarList(CarVO car);
	
	// 전기차 리스트 조회
	public ArrayList<CarVO> eSaveCarList(CarVO car);
	
	// 내연차 삭제
	public int gdelCar(CarVO car);
	
	// 전기차 리스트 조회
	public int edelCar(CarVO car);
	
	// 중요 내연차 저장
	public int gImpCar(CarVO car);
	
	// 중요 전기차 저장
	public int eImpCar(CarVO car);
	
	// 미보유 버튼 선택 업데이트
	public int memSaveCar(CarVO car);
	
	// 차량 저장시 업데이트
	public int memListSaveCar(CarVO car);
	
	// 전기차 초기화
	public int eTotalDel(CarVO car);
	
	// 내연차 초기화
	public int gTotalDel(CarVO car);
	
	// 멤버 조회
	public MemberVO carMem(CarVO car);

}
