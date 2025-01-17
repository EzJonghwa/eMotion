package com.eMotion.team.preperCar.web;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eMotion.team.member.vo.MemberVO;
import com.eMotion.team.preperCar.service.PreperCarServiceImpl;
import com.eMotion.team.preperCar.vo.PreperCarVO;
import com.eMotion.team.recommend.service.RecommendServiceImpl;
import com.eMotion.team.recommend.vo.FilterVO;
import com.eMotion.team.recommend.vo.LocalVO;
import com.eMotion.team.recommend.vo.SearchVO;

@Controller
public class PreperCarController {

	@Autowired
	PreperCarServiceImpl preService;
	
	@Autowired
	RecommendServiceImpl recoService;
	
	// 찜목록 (swb 작성)
	@GetMapping("/myLikeList")
	public String mySaveList(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		MemberVO vo = (MemberVO) session.getAttribute("login");
		 // 로그인 정보가 없는 경우
	    if (vo == null) {
	        // 알림창 메시지를 RedirectAttributes를 통해 전달
	        redirectAttributes.addFlashAttribute("alertMessage", "로그인이 필요합니다.");
	        return "redirect:/loginView"; // 로그인 페이지로 리다이렉트
	    }
	    
		String email = vo.getEmail();
		ArrayList<PreperCarVO> allAboutPreperCar = preService.AllAboutPreperCar(email);
		System.out.println(allAboutPreperCar);
		
		model.addAttribute("allAboutPreperCar", allAboutPreperCar);
		
		//상세카드에서 지역선택
	      ArrayList<LocalVO> firstLocalList = recoService.getFirstLocal();
	      model.addAttribute("firstLocal", firstLocalList);
	      model.addAttribute("email", email);
	      
		
		return "/member/likeList";
	}
	//사용자가 상세모달에서 다른 지역 선택해서 조회할 수 있도록	
	@PostMapping("/myLikeList/otherLocal")
	public ResponseEntity<Map<String, Object>> updateLocal(@RequestBody Map<String, String> payload,
												  			   @RequestParam(value = "addr", required = false) String addr,
												  			   @ModelAttribute("localVO") LocalVO localVO,
												  			   Model model) {
        addr = payload.get("selectedValue");
        System.out.println(addr);
        ArrayList<LocalVO> secondLocalList = recoService.getSecondLocal(addr);
        System.out.println(secondLocalList);

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
	
	
	//차량 검색하기
	@GetMapping("/myLikeList/searchCar") 
	public ResponseEntity<?> searchCar(@RequestParam(value = "keyword", required = false) String keyword,
									   @ModelAttribute("SearchVO") SearchVO searchVO,
										Model model, HttpSession session) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		String email = memberVO.getEmail();
		searchVO.setEmail(email);
		searchVO.setKeyword(keyword);
		
		try {
			ArrayList<PreperCarVO> result = preService.searchCar(searchVO);
			model.addAttribute("carList", result);
			model.addAttribute("email", email);
			System.out.println(result);
			System.out.println(email);
			
			return ResponseEntity.ok(result); // JSON 응답
		
		} catch (Exception e) { 
			e.printStackTrace(); 
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error processing request"); } }
}
