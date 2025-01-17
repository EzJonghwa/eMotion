package com.eMotion.team.car.service;

import java.util.ArrayList;

import com.eMotion.team.car.vo.CarVO;
import com.eMotion.team.member.vo.MemberVO;

public interface CarService {
	
	// 차 리스트 조회
	public ArrayList<CarVO> getCarList(CarVO car);
	
	// 차 저장
	public void saveCar(CarVO car) throws Exception;
	
	// 차 이름 체크
	public int carNameCheck(CarVO car) throws Exception;
	
	// 차 숫자 체크
	public int carNumCheck(CarVO car) throws Exception;
	
	// 내연차 리스트 조회
	public ArrayList<CarVO> gSaveCarList(CarVO car);
	
	// 전기차 리스트 조회
	public ArrayList<CarVO> eSaveCarList(CarVO car);
	
	// 내연차 삭제
	public void gdelCar(CarVO car) throws Exception;
	
	// 전기차 삭제
	public void edelCar(CarVO car) throws Exception;
	
	// 중요 내연차 저장
	public void gImpCar(CarVO car) throws Exception;
			
	// 중요 전기차 저장
	public void eImpCar(CarVO car) throws Exception;
	
	// 미보유 버튼 선택 업데이트
	public void memSaveCar(CarVO car) throws Exception;
	
	// 차량 초기화
	public void totalCarDel(CarVO car);
	
	// 멤버 조회
	public MemberVO carMem(CarVO car) throws Exception;
	
}
