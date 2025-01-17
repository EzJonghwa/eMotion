package com.eMotion.team.chart.web;


import com.eMotion.team.chart.service.MapChartService;
import com.eMotion.team.chart.vo.MapChartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

@Controller
public class MapChartController {
	
    @Autowired
    private MapChartService testChartService;
    
    // stationName, latitude, longitude를 받아서 statid 반환
    @PostMapping("/map/getStationId")
    @ResponseBody
    public String getStationId(@RequestBody MapChartVO request) {
        // stationName, latitude, longitude를 기반으로 statid를 조회
        String statid = testChartService.getStationId(request);
        return statid; // 클라이언트에 statid 반환
    }

}
