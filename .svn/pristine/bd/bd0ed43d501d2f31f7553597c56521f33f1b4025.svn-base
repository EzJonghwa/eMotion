package com.eMotion.team.preperCar.web;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.eMotion.team.member.vo.MemberVO;
import com.eMotion.team.preperCar.service.PreperCarServiceImpl;
import com.eMotion.team.preperCar.vo.PreperCarVO;
import com.eMotion.team.recommend.service.RecommendServiceImpl;
import com.eMotion.team.recommend.vo.LocalVO;
import com.eMotion.team.recommend.vo.RecommendVO;
import com.eMotion.team.recommend.vo.SearchVO;

@RestController
public class PreperCarRestController {

	@Autowired
	PreperCarServiceImpl preService;
	
	@Autowired
	RecommendServiceImpl recoService; 
	
	//검색 된 리스트에 찜목록과 겹치는 차량 확인하기
	@GetMapping("/getSelect")
	public ArrayList<PreperCarVO> checkAlreadyPreper(PreperCarVO preperCarVO) {
		ArrayList<PreperCarVO> preperList =null;
		try {
			preperList = preService.preperList(preperCarVO);
				if(preperList.size() > 0) {
					System.out.println("찜 목록에 존재합니다: " + preperCarVO);
					return preperList;
				}else {
					return null;
				}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리스트 내 찜 차량 확인 중 오류 발생!");
			return null;
		}
	}
	
	
	
		
		
		
		@PostMapping("/getSelect/insertPreper")
		public String insertPreper(PreperCarVO preperCarVO) {
//		    System.out.println("수신된 eCarName: " + preperCarVO.getECarName());
//		    System.out.println("수신된 email: " + preperCarVO.getEmail());
		    
			try {
				preService.insertPreper(preperCarVO);
				return "recommend/filteredListView";
			} catch (Exception e) {
				System.out.println("insert도중 오류 발생");
				e.printStackTrace();
				return "recommend/filteredListView";
			}
		}
		
		@PostMapping("/getSelect/deletePreper")
		public String deletePreper(PreperCarVO preperCarVO) {
//		    System.out.println("수신된 eCarName: " + preperCarVO.getECarName());
//		    System.out.println("수신된 email: " + preperCarVO.getEmail());	
		    
		    try {
		    	preService.deletePreper(preperCarVO);
				return "recommend/filteredListView";
			} catch (Exception e) {
				System.out.println("delete도중 오류 발생");
				e.printStackTrace();
				return "recommend/filteredListView";
			}
		}
		
}
