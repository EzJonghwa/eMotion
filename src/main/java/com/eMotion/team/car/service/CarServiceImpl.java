package com.eMotion.team.car.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eMotion.team.car.dao.ICarDAO;
import com.eMotion.team.car.vo.CarVO;
import com.eMotion.team.member.vo.MemberVO;

@Service("CarService")
public class CarServiceImpl implements CarService{
	
	@Autowired
	ICarDAO dao;
	
	@Override
	public ArrayList<CarVO> getCarList(CarVO car){
		
		// carType에 따라 테이블 이름 설정
        String tableName = null;
        if ("haveecar".equals(car.getCarType())) {
            tableName = "eleccarinfo";
        } else if ("havegcar".equals(car.getCarType())) {
            tableName = "gascarinfo";
        } else {
            throw new IllegalArgumentException("유효하지 않은 차량 유형입니다: " + car.getCarType());
        }

        // 테이블 이름을 CarVO에 저장 (MyBatis에서 동적으로 사용)
        car.setCarType(tableName);
		
		return dao.getCarList(car);
	}
	
	@Override
	public void saveCar(CarVO car) throws Exception {
		
		int result = 0;
		//System.out.println("saveCar" + car);

		if ("haveecar".equals(car.getCarType())) {
			result = dao.eSaveCar(car);
        } else if ("havegcar".equals(car.getCarType())) {
        	result = dao.gSaveCar(car);
        } else {
            throw new IllegalArgumentException("유효하지 않은 차량 유형입니다: " + car.getCarType());
        }
		
		if(result == 1) {
			System.out.println("memListcar : " + car);
			int cnt = dao.memListSaveCar(car);
			if(cnt == 0) {
				throw new Exception();
			}
		}
		
		if(result == 0) {
			throw new Exception();
		}
	}
	
	@Override
	public int carNameCheck(CarVO car) throws Exception {
		
		int cnt;
		
		if ("haveecar".equals(car.getCarType())) {
			cnt = dao.eCarCheck(car);
        } else if ("havegcar".equals(car.getCarType())) {
        	cnt = dao.gCarCheck(car);
        } else {
            throw new IllegalArgumentException("유효하지 않은 차량 유형입니다: " + car.getCarType());
        }
		
		return cnt;
	}
	
	@Override
	public int carNumCheck(CarVO car) throws Exception {
		
		int cnt;
		
		if ("haveecar".equals(car.getCarType())) {
			cnt = dao.eNumCheck(car);
        } else if ("havegcar".equals(car.getCarType())) {
        	cnt = dao.gNumCheck(car);
        } else {
            throw new IllegalArgumentException("유효하지 않은 차량 유형입니다: " + car.getCarType());
        }
		
		return cnt;
	}
	
	// 내연차 리스트 조회
	@Override
	public ArrayList<CarVO> gSaveCarList(CarVO car){
		
		System.out.println("서비스" + car);
		
		return dao.gSaveCarList(car);
	}
	
	// 전기차 리스트 조회
	@Override
	public ArrayList<CarVO> eSaveCarList(CarVO car){
		
		System.out.println("서비스" + car);
		
		return dao.eSaveCarList(car);
	}
	
	// 내연차 삭제
	@Override
	public void gdelCar(CarVO car) throws Exception {
		
		System.out.println("gdel삭제" + car);
		
		int result = dao.gdelCar(car);
		
		if(result == 0) {
			throw new Exception();
		}
		
	}
	
	
	// 전기차 삭제
	@Override
	public void edelCar(CarVO car) throws Exception {
		
		System.out.println("edel삭제" + car);
		
		int result = dao.edelCar(car);
		
		if(result == 0) {
			throw new Exception();
		}
		
	}
	
	// 중요 내연차 저장
	@Override
	public void gImpCar(CarVO car) throws Exception {
		
		System.out.println("gdel삭제" + car);
		
		int result = dao.gImpCar(car);
		
		if(result == 0) {
			throw new Exception();
		}
		
	}
	
	// 중요 전기차 저장
	@Override
	public void eImpCar(CarVO car) throws Exception {
		
		System.out.println("edel삭제" + car);
		
		int result = dao.eImpCar(car);
		
		if(result == 0) {
			throw new Exception();
		}
		
	}
	
	// 미보유 버튼 선택 업데이트
	@Override
	public void memSaveCar(CarVO car) throws Exception {
		
		System.out.println("memSaveCar : " + car);
		
		int result = dao.memSaveCar(car);
		
		if(result == 0) {
			throw new Exception();
		}
		
	}
	
	// 차량 초기화
	@Override
	public void totalCarDel(CarVO car){
		
		int resultECar = dao.eTotalDel(car);
		int resultGCar = dao.gTotalDel(car);
		int resultUpdate = dao.memSaveCar(car);
		
		System.out.println("resultECar : " + resultECar);
		System.out.println("resultGCar : " + resultGCar);
		System.out.println("resultUpdate : " + resultUpdate);
		
	}
	
	// 멤버 조회
	@Override
	public MemberVO carMem(CarVO car) throws Exception {
		
		MemberVO user = dao.carMem(car);

		if (user == null) {
			throw new Exception();
		}

		return user;
	}
	
}
