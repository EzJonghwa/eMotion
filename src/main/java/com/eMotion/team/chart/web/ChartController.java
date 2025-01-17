package com.eMotion.team.chart.web;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eMotion.team.chart.service.ChartServiceImpl;
import com.eMotion.team.chart.vo.ChartVO;

@Controller
public class ChartController {

	@Autowired
	ChartServiceImpl service;

	@GetMapping("/map/chart")
	public String chartView(@RequestParam("statid") String statid, Model model) {
	    // statid 값을 모델에 추가
	    model.addAttribute("statid", statid);
	    
	    // 필요한 데이터 처리
	    return "map/chart";  // 차트 관련 HTML만 반환 (페이지 이동 아님)
	}
	
	
	
	@ResponseBody
	@GetMapping("/map/getChart")
	public ArrayList<ChartVO> getChart(@ModelAttribute ("chartVO") ChartVO chartVO, Model model) {
		
		//System.out.println(chartVO);
		
		ArrayList<ChartVO> result = service.getChartData(chartVO);
		
		return result;
	}
}
