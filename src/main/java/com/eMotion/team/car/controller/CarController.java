package com.eMotion.team.car.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eMotion.team.car.service.CarService;
import com.eMotion.team.car.vo.CarVO;
import com.eMotion.team.member.vo.MemberVO;

@Controller
public class CarController {
	
	@Autowired
	CarService carService;
	
	// 보유 차 페이지 연결
	@RequestMapping("/saveListView")
	public String saveListView() {
		return "member/saveList";
	}
	
	@RequestMapping("/carSearch")
	@ResponseBody // JSON 데이터를 반환하기 위해 추가
	public ArrayList<CarVO> searchCars(@ModelAttribute CarVO car) { // 차량 유형 추가
	    
		//System.out.println("검색어: " + car.getKeyword());
        //System.out.println("차량 유형: " + car.getCarType());
        
        ArrayList<CarVO> carList = carService.getCarList(car);
        //System.out.println(carList);
        
        return carList; // 클라이언트에 응답
	}
	
	// 내연기관차 목록
	@RequestMapping("/saveCar")
	public String saveCarView(CarVO car, HttpSession session) {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail(); // DTO 객체의 getEmail() 사용
	        car.setEmail(email);
	    } else {
	        return "redirect:/loginView";
	    }
		
		// carName의 쉼표 제거
	    if (car.getCarName() != null) {
	        String sanitizedCarName = car.getCarName().replace(",", "").trim(); // 쉼표 제거 및 공백 처리
	        car.setCarName(sanitizedCarName); // 수정된 이름 설정
	    }
		
		//System.out.println(car.getCarBuyDate());
		//System.out.println(car.getCarName());
		//System.out.println(car.getCarType());
		//System.out.println(car.getEmail());
		
		int cnt;
		try {
			cnt = carService.carNumCheck(car);
			System.out.println("carNumCheck cnt" + cnt);
			if(cnt == 0) {
				car.setImportant("1");
			} else {
				car.setImportant("0");
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		try {
			carService.saveCar(car);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/saveListView";
	}

	// 차 이름 중복체크
	@RequestMapping("/carNameCheck")
	@ResponseBody
	public int emailCheck(CarVO car, HttpSession session) throws Exception {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail(); // DTO 객체의 getEmail() 사용
	        car.setEmail(email);
	    }
		
		//System.out.println("차이름 중복검사" + car);
		
		int cnt = carService.carNameCheck(car);
		
		return cnt;
	}
	
	// 내연차 리스트 
	@RequestMapping("/gSaveCarList")
	@ResponseBody // JSON 데이터를 반환하기 위해 추가
	public ArrayList<CarVO> gSaveCarList(CarVO car, HttpSession session, Model model) { // 차량 유형 추가
        
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail(); // DTO 객체의 getEmail() 사용
	        car.setEmail(email);
	    }
		
		//System.out.println(login);
		//System.out.println(car);
		
        ArrayList<CarVO> gSaveCarList = carService.gSaveCarList(car);
        System.out.println(gSaveCarList);
        model.addAttribute("gSaveCarList", gSaveCarList);
        
        return gSaveCarList; // 클라이언트에 응답
	}
	
	// 전기차 리스트 
	@RequestMapping("/eSaveCarList")
	@ResponseBody // JSON 데이터를 반환하기 위해 추가
	public ArrayList<CarVO> eSaveCarList(CarVO car, HttpSession session, Model model) { // 차량 유형 추가
        
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail(); // DTO 객체의 getEmail() 사용
	        car.setEmail(email);
	    }
		
		//System.out.println(login);
		//System.out.println(car);
		
        ArrayList<CarVO> eSaveCarList = carService.eSaveCarList(car);
        System.out.println(eSaveCarList);
        model.addAttribute("eSaveCarList", eSaveCarList);
        
        return eSaveCarList; // 클라이언트에 응답
	}
	
	// 내연차 삭제 
	@RequestMapping("/gdelCar")
	@ResponseBody
	public String gdelCar(CarVO car, @RequestParam String carType, HttpSession session) {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail();
	        car.setEmail(email);
	    }
		
	    try {
	        if ("havegcar".equals(carType)) {
	            carService.gdelCar(car);
	        } else {
	            throw new IllegalArgumentException("올바르지 않은 테이블 이름: " + carType);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	    return "success";
	}
	
	// 전기차 삭제 
	@RequestMapping("/edelCar")
	@ResponseBody
	public String edelCar(CarVO car, @RequestParam String carType, HttpSession session) {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail();
	        car.setEmail(email);
	    }
		
	    try {
	        if ("haveecar".equals(carType)) {
	            carService.edelCar(car);
	        } else {
	            throw new IllegalArgumentException("올바르지 않은 테이블 이름: " + carType);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	    return "success";
	}
	
	// 중요 내연차 저장
	@RequestMapping("/gImpCar")
	@ResponseBody
	public String gImpCar(CarVO car, @RequestParam String carType, HttpSession session) {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail();
	        car.setEmail(email);
	    }
		
	    try {
	        if ("havegcar".equals(carType)) {
	            carService.gImpCar(car);
	        } else {
	            throw new IllegalArgumentException("올바르지 않은 테이블 이름: " + carType);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	    return "success";
	}
	
	// 중요 전기차 저장
	@RequestMapping("/eImpCar")
	@ResponseBody
	public String eImpCar(CarVO car, @RequestParam String carType, HttpSession session) {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail();
	        car.setEmail(email);
	    }
		
	    try {
	        if ("haveecar".equals(carType)) {
	            carService.eImpCar(car);
	        } else {
	            throw new IllegalArgumentException("올바르지 않은 테이블 이름: " + carType);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	    return "success";
	}
		
	// 멤버에 savecar 저장
	@RequestMapping("/memSaveCar")
	@ResponseBody
	public String memSaveCar(CarVO car, HttpSession session) {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail();
	        car.setEmail(email);
	    }
		
		try {
			carService.memSaveCar(car);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	    return "success";
	}
	
	@RequestMapping("/getSaveCarStatus")
	@ResponseBody
	public Map<String, String> getSaveCarStatus(MemberVO vo, CarVO car, HttpSession session) throws Exception {
	    Map<String, String> response = new HashMap<>();
	    
	    MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail();
	        car.setEmail(email);
	    }
		System.out.println("getSaveCarStatus : " + car);
	    MemberVO user = carService.carMem(car);
	    
	    if (login != null) {
	        response.put("saveCar", user.getSaveCar());
	        response.put("notOwner", user.getNotOwner());
	        System.out.println(response);
	    } else {
	        response.put("saveCar", "N"); // 기본값
	        response.put("notOwner", "N"); // 기본값
	    }
	    return response;
	}
	
	// 전체 차량 삭제
	@RequestMapping("/totalCarDel")
	@ResponseBody
	public String totalCarDel(CarVO car, HttpSession session) {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail();
	        car.setEmail(email);
	    }
		
		try {
			carService.totalCarDel(car);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	    return "success";
	}
	
}
