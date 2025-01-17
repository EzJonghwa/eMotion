package com.eMotion.team.chart.service;

import com.eMotion.team.chart.dao.MapChartDAO;
import com.eMotion.team.chart.vo.MapChartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MapChartService {

	@Autowired
    private MapChartDAO testChartDAO;

    // stationName, latitude, longitude를 받아서 statid를 조회
    public String getStationId(MapChartVO request) {
        MapChartVO result = testChartDAO.getChartID(request); // DAO에서 statid 조회
        return result != null ? result.getStatid() : null; // statid 반환
    }
    
}
