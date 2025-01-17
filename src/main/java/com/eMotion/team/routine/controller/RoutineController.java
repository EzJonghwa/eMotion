package com.eMotion.team.routine.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eMotion.team.car.service.CarService;
import com.eMotion.team.car.vo.CarVO;
import com.eMotion.team.member.vo.MemberVO;
import com.eMotion.team.preperCar.service.PreperCarServiceImpl;
import com.eMotion.team.preperCar.vo.PreperCarVO;
import com.eMotion.team.routine.service.IRoutineServiceImpl;
import com.eMotion.team.routine.vo.ElecCarInfoVO;
import com.eMotion.team.routine.vo.ElecPriceVO;
import com.eMotion.team.routine.vo.GasCarInfoVO;
import com.eMotion.team.routine.vo.OilPriceEndVO;
import com.eMotion.team.routine.vo.OilPriceVO;
import com.eMotion.team.routine.vo.RoutineVO;
import com.eMotion.team.routine.vo.maxDataVO;
import com.eMotion.team.routine.vo.stationListVO;

@Controller
public class RoutineController {

	@Autowired
	IRoutineServiceImpl Routineservice;
	
	@Autowired
	CarService carService;
	
	@Autowired
	PreperCarServiceImpl preService;
	
	@RequestMapping("/routinemain")
	public String routineView(RoutineVO routine, GasCarInfoVO gascarinfo, ElecCarInfoVO eleccarinfo, maxDataVO maxVo, OilPriceVO oilpriceVO, stationListVO station, HttpSession session, Model model) {
	    try {
	        // 세션에서 로그인 정보를 가져와 email 설정
	        MemberVO login = (MemberVO) session.getAttribute("login");
	        if (login != null) {
	            String email = login.getEmail();
	            routine.setEmail(email);
	        }

	        // 서비스 호출하여 루틴 리스트 조회
	        ArrayList<RoutineVO> routineList = Routineservice.getRoutineList(routine);

	        // 결과 확인용 로그 출력
	        System.out.println(routineList);

	        // 조회한 데이터를 Model에 추가
	        model.addAttribute("routineList", routineList);
	        
	        
	        ArrayList<GasCarInfoVO> GascarList = Routineservice.getGascarList(routineList);
	        // 결과 확인용 로그 출력
	        System.out.println(GascarList);

	        // 조회한 데이터를 Model에 추가
	        model.addAttribute("GascarList", GascarList);
	        // routinemain.jsp로 이동
	        
	        ArrayList<ElecCarInfoVO> EleccarList = Routineservice.getEleccarList(routineList);
	        // 결과 확인용 로그 출력
	        System.out.println(EleccarList);

	        // 조회한 데이터를 Model에 추가
	        model.addAttribute("EleccarList", EleccarList);
	       
	        ArrayList<OilPriceVO>OilPirceList = Routineservice.getOilPirceList(routineList);
	        
	        System.out.println(OilPirceList);
	        
	        model.addAttribute("OilPirceList", OilPirceList);
	        
	        ArrayList<OilPriceEndVO>OilPirceEndList = Routineservice.getOilPirceEndList(routineList);
	        
	        System.out.println(OilPirceEndList);
	        
	        model.addAttribute("OilPirceEndList", OilPirceEndList);
	        
	        
	        ArrayList<stationListVO>StationList = Routineservice.getStationList(station);
	        model.addAttribute("StationList",StationList);
	        
       
	        // 정보의 최댓값 가져오기
	        maxDataVO maxData = Routineservice.getMaxList();
	        model.addAttribute("maxData", maxData); 
	        System.out.println(maxData);
	        
	        // routinemain.jsp로 이동
	        return "routine/routinemain";

	    } catch (Exception e) {
	        // 예외 처리: 에러 발생 시 에러 페이지로 이동
	        e.printStackTrace();
	        model.addAttribute("errorMessage", e.getMessage());
	        return "error/errorPage";
	    }
	}


	
	@RequestMapping("/routineDetail")
	public String routineDetailView(HttpSession session, PreperCarVO pcar, CarVO car , Model model) {
		
		if (session.getAttribute("login") == null) {
			return "redirect:/loginView"; // 로그인 정보가 없으면 로그인 페이지로 리디렉션
		}
		
		MemberVO login = (MemberVO) session.getAttribute("login");
		if (login != null) {
	        String email = login.getEmail(); // DTO 객체의 getEmail() 사용
	        car.setEmail(email);
	       
	    }
		
		ArrayList<CarVO> gSaveCarList = carService.gSaveCarList(car);
        System.out.println(gSaveCarList);
        model.addAttribute("gSaveCarList", gSaveCarList);
        
        
        ArrayList<CarVO> eSaveCarList = carService.eSaveCarList(car);
        System.out.println(eSaveCarList);
        model.addAttribute("eSaveCarList", eSaveCarList);
        
        MemberVO vo = (MemberVO) session.getAttribute("login");
		String email = vo.getEmail();
		ArrayList<PreperCarVO> allAboutPreperCar = preService.AllAboutPreperCar(email);
		System.out.println(allAboutPreperCar);
		
		model.addAttribute("allAboutPreperCar", allAboutPreperCar);
	        // 클라이언트에 응답
		return "routine/routineDetail";
	}
	
	
	
	
	
	
	@RequestMapping("/routineDetailRewrite")
	public String routineDetailRewriteView(HttpSession session, RoutineVO routineVO, CarVO car , Model model) throws Exception {
	    if (session.getAttribute("login") == null) {
	        return "redirect:/loginView"; // 로그인 정보가 없으면 로그인 페이지로 리디렉션
	    }

	    MemberVO login = (MemberVO) session.getAttribute("login");
	    if (login != null) {
	        String email = login.getEmail(); // DTO 객체의 getEmail() 사용
	        car.setEmail(email);
	    }

	    ArrayList<CarVO> gSaveCarList = carService.gSaveCarList(car);
	    model.addAttribute("gSaveCarList", gSaveCarList);

	    ArrayList<CarVO> eSaveCarList = carService.eSaveCarList(car);
	    model.addAttribute("eSaveCarList", eSaveCarList);

	    // 수정할 데이터 가져오기
	    int routineNo = routineVO.getRoutineNo();
	    RoutineVO existingRoutine = Routineservice.getRoutine(routineNo); // 기존 루틴 정보 조회
	    model.addAttribute("routine", existingRoutine); // 모델에 루틴 정보 담기
	    
	    MemberVO vo = (MemberVO) session.getAttribute("login");
		String email = vo.getEmail();
		ArrayList<PreperCarVO> allAboutPreperCar = preService.AllAboutPreperCar(email);
		System.out.println(allAboutPreperCar);
		
		model.addAttribute("allAboutPreperCar", allAboutPreperCar);

	    return "routine/routineDetailRewrite"; // JSP로 포워딩
	}

//	@RequestMapping("/routineDetail")
//	public String routineDetailView() {
//		return "routine/routineDetail";
//	}
//	
	
	
	
	
	@PostMapping("/routineWriteDo")
	public String routineWriteDo(RoutineVO routineVO, RedirectAttributes redirectAttributes, Model model) throws Exception {
		// 게시글 작성
		try {
			System.out.println("수정 요청 데이터: " + routineVO); // 전달된 데이터 확인
			// RoutineService를 통해 DB 업데이트 실행
			Routineservice.writeRoutine(routineVO);

			// 성공 메시지 설정
			redirectAttributes.addFlashAttribute("message", "수정이 완료되었습니다.");
			return "redirect:/routinemain"; // 루틴 목록 페이지로 이동
		} catch (Exception e) {
			e.printStackTrace();

			// 실패 메시지 설정
			redirectAttributes.addFlashAttribute("errorMessage", "수정에 실패하였습니다. 다시 시도해주세요.");
			model.addAttribute("errorMessage", "루틴 수정 중 오류가 발생했습니다: " + e.getMessage());
			return "redirect:/routineDetailRewrite"; // 다시 수정 페이지로 이동
		}
	}
	
	@PostMapping("/routineReWriteDo")
	public String routineReWriteDo(RoutineVO Routine ) throws Exception {
		// 게시글 작성
		Routineservice.RewriteRoutine(Routine);
		return "redirect:/routinemain";
	}
	
//	@PostMapping("/routineDeleteDo")
//	 public String deleteRoutine(@RequestParam("routineNo") int routineNo,
//             @RequestParam("email") String email,
//             RedirectAttributes redirectAttributes) {
//			try {
//			// Service의 deleteRoutine 메서드를 호출
//				Routineservice.deleteRoutine(routineNo, email);
//			redirectAttributes.addFlashAttribute("message", "삭제가 완료되었습니다.");
//			} catch (Exception e) {
//			redirectAttributes.addFlashAttribute("error", "삭제 중 오류가 발생했습니다.");
//			}
//			return "redirect:/routinemain";  // 삭제 후 루틴 목록 페이지로 리다이렉트
//			}
//	
//	@PostMapping("/routineDeleteDo")
//	 public String deleteRoutine(int routineNo) throws Exception {
//		
//		Routineservice.deleteRoutine(routineNo);
//		return "redirect:/routinemain";  // 삭제 후 루틴 목록 페이지로 리다이렉트
//			}
	@PostMapping("/routinedeleteDo/{routineNo}")
    public ResponseEntity<?> deleteRoutine(
            @RequestParam("email") String email,
            @PathVariable("routineNo") String routineNo) {
        try {
        	Routineservice.deleteRoutine(email, routineNo);
            return ResponseEntity.ok("Routine deleted successfully using POST.");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }
	
	
	@RequestMapping("/routineTest")
	public String routinetest(stationListVO station, HttpSession session, Model model) throws Exception {
		ArrayList<stationListVO>StationList = Routineservice.getStationList(station);
        model.addAttribute("StationList",StationList);
		return "routine/routinetest";
	}
	
}
