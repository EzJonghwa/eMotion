package com.eMotion.team.map.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eMotion.team.map.service.ChargingStationService;
import com.eMotion.team.map.service.ServiceCenterService;
import com.eMotion.team.map.vo.ChargingStationVO;
import com.eMotion.team.map.vo.ServiceCenterVO;

import com.google.zxing.WriterException;  
import com.google.zxing.qrcode.QRCodeWriter;  
import com.google.zxing.common.BitMatrix;  
import com.google.zxing.BarcodeFormat;  
import com.google.zxing.client.j2se.MatrixToImageWriter;  
import org.springframework.http.HttpHeaders;  
import org.springframework.http.HttpStatus;  
import org.springframework.http.ResponseEntity;  
import java.io.ByteArrayOutputStream;

@Controller
public class mapController {

    @Autowired
    private ServiceCenterService servicecenterService;
    
    @Autowired
    private ChargingStationService chargingStationService;
    
    @GetMapping("/generate-qr")
    public ResponseEntity<byte[]> generateQRCode(
        @RequestParam String startname, 
        @RequestParam double startx, 
        @RequestParam double starty, 
        @RequestParam String goalname, 
        @RequestParam double goalx, 
        @RequestParam double goaly,
        @RequestParam(required = false) String via1name, 
        @RequestParam(required = false) Double via1x, 
        @RequestParam(required = false) Double via1y,
        @RequestParam(required = false) String via2name, 
        @RequestParam(required = false) Double via2x, 
        @RequestParam(required = false) Double via2y,
        @RequestParam(required = false) String via3name, 
        @RequestParam(required = false) Double via3x, 
        @RequestParam(required = false) Double via3y) {

        // URL 구성
        StringBuilder qrCodeText = new StringBuilder("tmap://route?startname=" + URLEncoder.encode(startname, StandardCharsets.UTF_8)
            + "&startx=" + startx + "&starty=" + starty
            + "&goalname=" + URLEncoder.encode(goalname, StandardCharsets.UTF_8)
            + "&goalx=" + goalx + "&goaly=" + goaly);

        // 경유지 추가
        if (via1name != null && via1x != null && via1y != null) {
            qrCodeText.append("&via1name=")
                .append(URLEncoder.encode(via1name, StandardCharsets.UTF_8))
                .append("&via1x=").append(via1x)
                .append("&via1y=").append(via1y);
        }
        if (via2name != null && via2x != null && via2y != null) {
            qrCodeText.append("&via2name=")
                .append(URLEncoder.encode(via2name, StandardCharsets.UTF_8))
                .append("&via2x=").append(via2x)
                .append("&via2y=").append(via2y);
        }
        if (via3name != null && via3x != null && via3y != null) {
            qrCodeText.append("&via3name=")
                .append(URLEncoder.encode(via3name, StandardCharsets.UTF_8))
                .append("&via3x=").append(via3x)
                .append("&via3y=").append(via3y);
        }

        // QR 코드 생성
        int width = 200;
        int height = 200;

        try {
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            BitMatrix bitMatrix = qrCodeWriter.encode(qrCodeText.toString(), BarcodeFormat.QR_CODE, width, height);

            // 이미지 데이터를 메모리에 저장
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", outputStream);

            // HTTP 응답으로 이미지 데이터 전송
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Type", "image/png");

            return new ResponseEntity<>(outputStream.toByteArray(), headers, HttpStatus.OK);

        } catch (WriterException | IOException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/service-centers")
    @ResponseBody
    public List<ServiceCenterVO> getServiceCenters() {
        return servicecenterService.getServiceCenter();  
    }
    
    @GetMapping("/charging-station")
    @ResponseBody
    public List<ChargingStationVO> getChargingStation() {
    	
    	return chargingStationService.getChargingStation();

    }
    
    
    @RequestMapping("/map")
    public String mapView(@RequestHeader("User-Agent") String userAgent, Model model) {
    	
        boolean isMobile = userAgent.matches(".*(Mobile|Android|iPhone).*");
        model.addAttribute("isMobile", isMobile); // 뷰로 데이터 전달
        
        // DB에서 ChargingStation 데이터를 가져옴
        List<ChargingStationVO> chargingStations = chargingStationService.getChargingStation();
        
        List<ServiceCenterVO> serviceCenters = servicecenterService.getServiceCenter();
        
        // ChargingStationVO 데이터를 StationPoint로 변환
        List<StationPoint> stationPoints = new ArrayList<>();
        for (ChargingStationVO station : chargingStations) {
            StationPoint point = new StationPoint(
                station.getName(),
                station.getNoor_lat(),
                station.getNoor_lon(),
                0
            );
            stationPoints.add(point);
        }
        
        // ServiceCenterVO 데이터를 ServiceCenterPoint로 변환
        List<ServiceCenterPoint> serviceCenterPoints = new ArrayList<>();
        for (ServiceCenterVO center : serviceCenters) {
            ServiceCenterPoint point = new ServiceCenterPoint(
                center.getName(),
                center.getPlace(),
                center.getBrand(),
                center.getTel(),
                center.getLat(),
                center.getLon(),
                center.getNote(),
                0
            );
            serviceCenterPoints.add(point);
        }
        
        
        Map<String, String> brandIcons = new HashMap<>();
             
    	brandIcons.put("AUDI", "/resources/assets/img/Center/AUDICenter.png");
    	brandIcons.put("BENZ", "/resources/assets/img/Center/BENZCenter.png");
    	brandIcons.put("BMW", "/resources/assets/img/Center/BMWCenter.png");
    	brandIcons.put("BMW&MINI", "/resources/assets/img/Center/BMW&MINICenter.png");
    	brandIcons.put("Cadillac", "/resources/assets/img/Center/CADILLACCenter.png");
    	brandIcons.put("Chevrolet", "/resources/assets/img/Center/CHEVROLETCenter.png");
    	brandIcons.put("HYUNDAI", "/resources/assets/img/Center/HYUNDAICenter.png");
    	brandIcons.put("JAGUAR", "/resources/assets/img/Center/JAGUARCenter.png");
    	brandIcons.put("JEEP", "/resources/assets/img/Center/JEEPCenter.png");
    	brandIcons.put("KGM", "/resources/assets/img/Center/KGMCenter.png");
    	brandIcons.put("KIA", "/resources/assets/img/Center/KIACenter.png");
    	brandIcons.put("Lexus", "/resources/assets/img/Center/LEXUSCenter.png");
    	brandIcons.put("MINI", "/resources/assets/img/Center/MINICenter.png");
    	brandIcons.put("PORSCHEC", "/resources/assets/img/Center/PORSCHECCenter.png");
    	brandIcons.put("Peugeot", "/resources/assets/img/Center/PEUGEOTCenter.png");
    	brandIcons.put("Polestar", "/resources/assets/img/Center/POLESTARTCenter.png");
    	brandIcons.put("Renault", "/resources/assets/img/Center/RENAULTCenter.png");
    	brandIcons.put("TOYOTA", "/resources/assets/img/Center/TOYOTACenter.png");
    	brandIcons.put("VolksWagen", "/resources/assets/img/Center/VOLKSWAGENCenter.png");

        // 변환된 JSON 데이터를 모델에 추가
        model.addAttribute("stationPoints", stationPoints);
        model.addAttribute("serviceCenterPoints", serviceCenterPoints);
        model.addAttribute("brandIcons", brandIcons);
             
        if (isMobile) {
            return "map/mobilemap";  // 모바일 전용 JSP
        } else {
            return "map/map";  // PC 전용 JSP
        }
    }
    
    public static class StationPoint {
        private String name;
        private double noor_lat;
        private double noor_lon;
        private double distance;

        public StationPoint(String name, double lat, double lon, double distance) {
            this.name = name;
            this.noor_lat = lat;
            this.noor_lon = lon;
            this.distance = distance;
        }

        // Getter, Setter
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public double getLat() {
            return noor_lat;
        }

        public void setLat(double lat) {
            this.noor_lat = lat;
        }

        public double getLon() {
            return noor_lon;
        }

        public void setLon(double lon) {
            this.noor_lon = lon;
        }

        public double getDistance() {
            return distance;
        }

        public void setDistance(double distance) {
            this.distance = distance;
        }
    }
    
    public static class ServiceCenterPoint 
    {
    	private String name;
        private String place;
        private String brand;
        private String tel;
        private double lat;
        private double lon;
        private String note;
        private double distance;
        
        
        
		public ServiceCenterPoint(String name, String place, String brand, String tel, double lat, double lon,
				String note, double distance) {
			super();
			this.name = name;
			this.place = place;
			this.brand = brand;
			this.tel = tel;
			this.lat = lat;
			this.lon = lon;
			this.note = note;
			this.distance = distance;
		}
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPlace() {
			return place;
		}
		public void setPlace(String place) {
			this.place = place;
		}
		public String getBrand() {
			return brand;
		}
		public void setBrand(String brand) {
			this.brand = brand;
		}
		public String getTel() {
			return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
		}
		public double getLat() {
			return lat;
		}
		public void setLat(double lat) {
			this.lat = lat;
		}
		public double getLon() {
			return lon;
		}
		public void setLon(double lon) {
			this.lon = lon;
		}
		public String getNote() {
			return note;
		}
		public void setNote(String note) {
			this.note = note;
		}

		public double getDistance() {
			return distance;
		}

		public void setDistance(double distance) {
			this.distance = distance;
		}
        
    }

}