package com.eMotion.team.compare.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eMotion.team.compare.service.CarCompareService;
import com.eMotion.team.compare.vo.CarElecCompareVO;
import com.eMotion.team.compare.vo.CarGasCompareVO;
import com.eMotion.team.member.vo.MemberVO;

@Controller
public class CarCompareController {
	
	@Autowired
	CarCompareService carCompareService;
	
	
	@RequestMapping("/carCompare")
	public String carCompare(HttpSession session) {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
			System.out.println("로그인 되어있어요");
		} else {
	        return "redirect:/loginView";
	    }
		
		return "compare/carCompare";
	}
	
	@RequestMapping("/carElecCompare")
	public String carElecCompare(HttpSession session) {
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
			System.out.println("로그인 되어있어요");
		} else {
	        return "redirect:/loginView";
	    }
		
		return "compare/carElecCompare";
	}
	
	
	@RequestMapping("/elecCompareList")
	@ResponseBody // JSON 데이터를 반환하기 위해 추가
	public ArrayList<CarElecCompareVO> elecCompareList(@ModelAttribute CarElecCompareVO compare) {
		
		ArrayList<CarElecCompareVO> elecList = carCompareService.elecCompareList(compare);
		System.out.println(elecList);
		
		return elecList;
	}
	
	@RequestMapping(value = "/carCompare/elecCar", method = RequestMethod.POST)
	@ResponseBody
	public CarElecCompareVO getElecCar(@RequestBody CarElecCompareVO compare) throws Exception {
		
		CarElecCompareVO elecCar = carCompareService.getElecCar(compare);
		
		return elecCar;
	}
	
	@RequestMapping("/gasCompareList")
	@ResponseBody // JSON 데이터를 반환하기 위해 추가
	public ArrayList<CarGasCompareVO> gasCompareList(@ModelAttribute CarGasCompareVO compare) {
		
		ArrayList<CarGasCompareVO> gasList = carCompareService.gasCompareList(compare);
		
		return gasList;
	}
	
	@RequestMapping(value = "/carCompare/gasCar", method = RequestMethod.POST)
	@ResponseBody
	public CarGasCompareVO getGasCar(@RequestBody CarGasCompareVO compare) throws Exception {
		
		CarGasCompareVO gasCar = carCompareService.getGasCar(compare);
		
		return gasCar;
	}
	
	@RequestMapping(value = "/carCompare/saveECar", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<CarElecCompareVO> saveECar(CarElecCompareVO compare, HttpSession session){
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail(); // DTO 객체의 getEmail() 사용
	        compare.setEmail(email);
	    }
		
		ArrayList<CarElecCompareVO> saveECar = carCompareService.saveECar(compare);
		
		return saveECar;
		
	}
	
	@RequestMapping(value = "/carCompare/likeECar", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<CarElecCompareVO> likeECar(CarElecCompareVO compare, HttpSession session){
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail(); // DTO 객체의 getEmail() 사용
	        compare.setEmail(email);
	    }
		
		ArrayList<CarElecCompareVO> likeECar = carCompareService.likeECar(compare);
		
		return likeECar;
		
	}
	
	@RequestMapping(value = "/carCompare/saveGCar", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<CarGasCompareVO> saveGCar(CarGasCompareVO compare, HttpSession session){
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail(); // DTO 객체의 getEmail() 사용
	        compare.setEmail(email);
	    }
		
		ArrayList<CarGasCompareVO> saveGCar = carCompareService.saveGCar(compare);
		
		return saveGCar;
		
	}
	
	
	
	
	
	
}
