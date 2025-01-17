package com.eMotion.team.recommend.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eMotion.team.member.vo.MemberVO;
import com.eMotion.team.recommend.service.FilterServiceImpl;
import com.eMotion.team.recommend.service.RecommendServiceImpl;
import com.eMotion.team.recommend.vo.FilterVO;
import com.eMotion.team.recommend.vo.LocalVO;
import com.eMotion.team.recommend.vo.RecommendVO;
import com.eMotion.team.recommend.vo.SearchVO;

@Controller
public class RecommendController {

	@Autowired
	RecommendServiceImpl recoService;
	@Autowired
	FilterServiceImpl filterService;

	//차종 필터 불러오기
	@GetMapping("/filter")
	public String showCate(Model model) {
		ArrayList<FilterVO> passCateVO = filterService.getPassengerCate();
		ArrayList<FilterVO> freiCateVO = filterService.getFreightCate();
		ArrayList<FilterVO> vansCateVO = filterService.getVansCate();
		ArrayList<FilterVO> motoCateVO = filterService.getMotorsCate();

		model.addAttribute("passCate", passCateVO);
		model.addAttribute("freiCate", freiCateVO);
		model.addAttribute("vansCate", vansCateVO);
		model.addAttribute("motoCate", motoCateVO);

		return "recommend/filterView";
	}

	//브랜드 불러오고 검색하기
	@GetMapping("/filter/updateSelected") 
	public ResponseEntity<?> searchCarBrand(@RequestParam(value = "keyword", required = false) String keyword,
											@ModelAttribute("searchVO") SearchVO searchVO, 
											Model model) {
		try {
			searchVO.setKeyword(keyword);
			ArrayList<FilterVO> result = filterService.searchCarBrand(keyword);
			model.addAttribute("carBrandList", result);
			//System.out.println(result);
			
			return ResponseEntity.ok(result); // JSON 응답
		
		} catch (Exception e) { 
			e.printStackTrace(); 
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error processing request"); } }

	// 카테고리 선택 시 건 수가 실시간으로 반영되도록	
	@PostMapping("/filter/updateSelected") 
	public ResponseEntity<Map<String, Object>> updateSelected(@RequestBody SearchVO selectedData,
												 @ModelAttribute("searchVO") SearchVO searchVO, 
												 Model model) {
		ArrayList<String> selectedCates = selectedData.getSelectedCates();
		ArrayList<String> selectedBrands = selectedData.getSelectedBrands();
		int selectedMinCarPrice = selectedData.getSelectedMinCarPrice();
		int selectedMaxCarPrice = selectedData.getSelectedMaxCarPrice();
		ArrayList<String> selectedSubYN = selectedData.getSelectedSubYN();
		System.out.println("선택된 카테고리: " + selectedCates);
		System.out.println("선택된 브랜드: " + selectedBrands);
		System.out.println("선택된 최소예산: " + selectedMinCarPrice);
		System.out.println("선택된 최대예산: " + selectedMaxCarPrice);
		System.out.println("선택된 보조금여부: " + selectedSubYN);
		
		searchVO.setSelectedCates(selectedCates);
		searchVO.setSelectedBrands(selectedBrands);
		searchVO.setSelectedMinCarPrice(selectedMinCarPrice);
		searchVO.setSelectedMaxCarPrice(selectedMaxCarPrice);
		searchVO.setSelectedSubYN(selectedSubYN);
		
		int nowCount = recoService.getCount(searchVO); 
		System.out.println("선택된 건수: " + nowCount);

		Map<String, Object> responseMap = new HashMap<>();
	    responseMap.put("nowCount", nowCount);
		model.addAttribute("nowCount", nowCount); 
		model.addAttribute("selectedCate", selectedCates); 
		model.addAttribute("selectedBr", selectedBrands);
		model.addAttribute("selectedMinCarPrice", selectedMinCarPrice);
		model.addAttribute("selectedMaxCarPrice", selectedMaxCarPrice);
		model.addAttribute("selectedSubYN", selectedSubYN);
		
		return ResponseEntity.ok(responseMap); 
	}
	
	// 최종선택완료 후 불러오는 차량데이터
	   @PostMapping("/getSelect")
	   public String getSelect(@ModelAttribute("searchVO") SearchVO searchVO,
	                     Model model, HttpSession session) {
	      
	      MemberVO memberVO = (MemberVO) session.getAttribute("login");
	      
	      searchVO.setEmail(memberVO != null ? memberVO.getEmail() : null);
	      if(searchVO.getPriceOrder() ==null) {
		    searchVO.setPriceOrder("default");
		  }
		  if(searchVO.getSingleOrder() == null) {
		    searchVO.setSingleOrder("default");
		  }
			session.setAttribute("searchVO", searchVO);
	       // 필터링된 목록 가져오기
	      ArrayList<RecommendVO> carList = recoService.getFilteredList(searchVO);
	      model.addAttribute("details", carList);
	      System.out.println(carList);
	       
	      //상세카드에서 지역선택
	      ArrayList<LocalVO> firstLocalList = recoService.getFirstLocal();
	      model.addAttribute("firstLocal", firstLocalList);
	      
	      return "/recommend/filteredListView";
	   }

	// 정렬 버튼 선택에 따라 실시간 정렬하기
	@PostMapping("/getSelect/updateOrderValue")
	public ResponseEntity<String> updateOrderValue(@RequestBody Map<String, String> payload,
												   HttpSession session,
												   @ModelAttribute("searchVO") SearchVO searchVO,
												   Model model){
		//기존 searchVO 가져오기
		searchVO = (SearchVO) session.getAttribute("searchVO");
	    if (searchVO == null) {
	        return ResponseEntity.badRequest().body("searchVO not found in session");
	    }
		
		String priceOrderValue = payload.get("priceOrder");
		String singleOrderValue = payload.get("singleOrder");
		
		//정렬기준값 세팅
		searchVO.setPriceOrder(priceOrderValue);
		searchVO.setSingleOrder(singleOrderValue);
		System.out.println(searchVO);
		session.setAttribute("priceOrder", priceOrderValue);
		session.setAttribute("singleOrder", singleOrderValue);
		System.out.println(session.getAttribute("priceOrder"));
		System.out.println(session.getAttribute("singleOrder"));
		
		//정렬기준값 세팅 후 목록 다시 불러오기
		ArrayList<RecommendVO> carList = recoService.getFilteredList(searchVO);
	    model.addAttribute("details", carList);
	    ArrayList<LocalVO> firstLocalList = recoService.getFirstLocal();
		model.addAttribute("firstLocal", firstLocalList);
		
		
		
		return ResponseEntity.ok("통신완료");
	}
	
	//사용자가 상세모달에서 다른 지역 선택해서 조회할 수 있도록
	@PostMapping("/getSelect/otherLocal")
	public ResponseEntity<Map<String, Object>> updateSelection(@RequestBody Map<String, String> payload,
												  			   @RequestParam(value = "addr", required = false) String addr,
												  			   @ModelAttribute("localVO") LocalVO localVO,
												  			   Model model) {
        addr = payload.get("selectedValue");
        ArrayList<LocalVO> secondLocalList = recoService.getSecondLocal(addr);

        String addr1 = payload.get("firstValue");
        String addr2 = payload.get("secondValue");
        String carName = payload.get("thirdValue");
        String carCate = payload.get("forthValue");
        localVO.setAddr(addr1);
        localVO.setSelectedAddr(addr2);
        localVO.setCarName(carName);
        localVO.setCarCate(carCate);
        
        ArrayList<LocalVO> selectedLocInfoList = recoService.getSelectedLocInfo(localVO);
        
        Map<String, Object> responseMap = new HashMap<>();
	    responseMap.put("secondLocal", secondLocalList);
	    responseMap.put("selectedLocInfo", selectedLocInfoList);
	    model.addAttribute("secondLocal", secondLocalList);
	    model.addAttribute("selectedLocInfo", selectedLocInfoList);

        // 필요한 작업 후 응답 반환
        return ResponseEntity.ok(responseMap);
    }



}