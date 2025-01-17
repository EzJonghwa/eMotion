
	const TMAP_API_KEY = 'hK16EQ22PI8xceOsMCRZI6GSYMhAaI2s9pmKiS2M';

	let maps = {};

	//지도 초기화 함수
	function initializeMap(mapId) {
	 // 이미 지도 객체가 있는지 확인
	 if (!maps[mapId]) {
	     maps[mapId] = new Tmapv2.Map(mapId, {
	         center: new Tmapv2.LatLng(37.5665, 126.9780),
	         width: "100%",
	         height: "270px",
	         zoom: 14,
	     });
	 }
	}

	 async function drawRoute(startLocation, endLocation, mapId, stationListId,mainlist) {
	   	 const map = maps[mapId];
	   	 try {
	   	     const startCoords = await getCoordinatesFromLocation(startLocation);
	   	     const endCoords = await getCoordinatesFromLocation(endLocation);

	   	     console.log(startLocation, endLocation);
	   	     if (!startCoords || !endCoords) {
	   	         alert("출발지와 도착지의 좌표를 가져올 수 없습니다.");
	   	         return;
	   	     }

	   	     // 경로 그리기
	   	     $.ajax({
	   	         type: "POST",
	   	         url: "https://apis.openapi.sk.com/tmap/routes?version=1",
	   	         headers: { "appKey": TMAP_API_KEY },
	   	         contentType: "application/json",
	   	         data: JSON.stringify({
	   	             startX: startCoords.lon, startY: startCoords.lat,
	   	             endX: endCoords.lon, endY: endCoords.lat,
	   	             reqCoordType: "WGS84GEO", resCoordType: "WGS84GEO", searchOption: 0,
	   	         }),
	   	         success: function (response) {
	   	             const resultData = response.features;
	   	             const routeCoordinates = resultData
	   	                 .filter(feature => feature.geometry.type === "LineString")
	   	                 .flatMap(feature => feature.geometry.coordinates)
	   	                 .map(coord => new Tmapv2.LatLng(coord[1], coord[0]));

	   	             const routeLayer = new Tmapv2.Polyline({
	   	                 path: routeCoordinates,
	   	                 strokeColor: "#FF0000",
	   	                 strokeWeight: 4,
	   	                 map: map,
	   	             });

	   	             const bounds = new Tmapv2.LatLngBounds();
	   	             routeCoordinates.forEach(coord => bounds.extend(coord));
	   	             map.fitBounds(bounds);

	   	             // 충전소 필터링 및 리스트 표시
	   	             filterChargingStations(routeCoordinates, map, stationListId,mainlist);
	   	         },
	   	         error: function (error) {
	   	             console.error("경로 탐색 실패:", error);
	   	             alert("경로 탐색 중 오류가 발생했습니다.");
	   	         }
	   	     });
	   	 } catch (error) {
	   	     console.error("경로 계산 오류:", error);
	   	 }
	   	}
	             		
	   	function filterChargingStations(routeCoordinates, map, stationListId,mainlist) {
	   	 const RADIUS = 0.1; // 반경 300m
	   	 const markers = [];
	   	
	   	 const stationsWithDistances = chargingStations.map(station => {
	   	     const minDistance = routeCoordinates.reduce((minDist, coord) => {
	   	         const dist = calculateDistance(coord.lat(), coord.lng(), station.lat, station.lon);
	   	         return Math.min(minDist, dist);
	   	     }, Infinity);
	   	     return { ...station, distance: minDistance };
	   	 });
	   	
	   	 const stationsInRadius = stationsWithDistances
	   	     .filter(station => station.distance <= RADIUS)
	   	     .sort((a, b) => a.distance - b.distance);
	   	
	   	  document.getElementById(stationListId).innerHTML = stationsInRadius.map(function(station, index) {
	   	        var uniqueId = "mainlist-" + mainlist + "-" + index; // 문자열 더하기 방식으로 ID 생성
	   	        return "<div id='" + uniqueId + "' class='liststyle-inner mb-3' " + 
	   	               "data-price-member='" + station.priceForMember + "' " +
	   	               "data-price-nonmember='" + station.priceForNonMember + "'>" + 
	   	               "<span class='font-weight-bold'>[" + station.isFast + "]</span> " + 
	   	               station.name + "<br> (~ " + station.distance.toFixed(2) + " km)</div>";
	   	    }).join("");


	   	  stationsInRadius.forEach((station, index) => {
	   	        var uniqueId = "mainlist-" + mainlist + "-" + index; // 문자열 더하기 방식으로 ID 생성
	   	        document.getElementById(uniqueId).addEventListener("click", () => {
	   	            console.log(station.name + " 클릭됨");
	   	            console.log("회원 가격:", station.priceForMember);
	   	            console.log("비회원 가격:", station.priceForNonMember);
   
	   	        document.getElementById("run-info-elec-name-"+mainlist).innerHTML =
	   	        	"<div class='col py-2 liststyle-inner'><span>[" + station.isFast + "]"+ station.name +"</span></div>";
		   	     document.getElementById("run-info-elec-member-"+mainlist).innerHTML =
		   	        	"<div class='col py-2 liststyle-inner' id='elecmember-" + mainlist + "' >회원 : <span>"+ station.priceForMember +"</span>원</div>";
			   	  document.getElementById("run-info-elec-nonmember-"+mainlist).innerHTML =
		 	        	"<div class='col py-2 liststyle-inner' id='elecnonmember-" + mainlist + "' >비회원 : <span>"+ station.priceForNonMember +"</span>원</div>";	
					
			   	  document.getElementById('elecmember-'+ mainlist).addEventListener('click', function () {
	          		    var memberPrice = this.querySelector('span').innerText; // span의 값 가져오기
	          		    document.getElementById('elec-'+ mainlist).value = memberPrice; // <input id="elec">에 값 설정
	          		    
	          		});

	          		document.getElementById('elecnonmember-'+ mainlist).addEventListener('click', function () {
	          		    var nonMemberPrice = this.querySelector('span').innerText; // span의 값 가져오기
	          		    document.getElementById('elec-'+ mainlist).value = nonMemberPrice; // <input id="elec">에 값 설정
	          		});
	          		
	   	        });
	   	        
	    });
	   	 displayMarkers(stationsInRadius, map, markers); // 마커 표시
	   }
	   	
	//마커 표시
	function displayMarkers(stationsInRadius, map, markers) {
	    // 기존 마커 제거
	    markers.forEach(marker => marker.setMap(null));
	    markers.length = 0; // 배열 초기화

	    // 새로운 마커 추가
	    stationsInRadius.forEach(station => {
	        const marker = new Tmapv2.Marker({
	            position: new Tmapv2.LatLng(station.lat, station.lon),
	            map: map,
	            title: station.name,
	        });
	        markers.push(marker);

	        // 마커 클릭 이벤트
	        marker.addListener("click", () => {
	            console.log(`${station.name} 마커 클릭됨`);
	        });
	    });
	}

	//거리 계산 함수
	function calculateDistance(lat1, lon1, lat2, lon2) {
	 const R = 6371; // 지구 반지름 (km)
	 const dLat = (lat2 - lat1) * Math.PI / 180;
	 const dLon = (lon2 - lon1) * Math.PI / 180;
	 const a = Math.sin(dLat / 2) ** 2 + Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) * Math.sin(dLon / 2) ** 2;
	 return 2 * R * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	}

	//텍스트로 장소 좌표를 가져오는 함수
	async function getCoordinatesFromLocation(location) {
	    try {
	        const url = 'https://apis.openapi.sk.com/tmap/pois?version=1&searchKeyword=' + encodeURIComponent(location) + 
	                    '&resCoordType=WGS84GEO&reqCoordType=WGS84GEO&count=1';
	        const response = await fetch(url, { headers: { "appKey": TMAP_API_KEY } });
	        const data = await response.json();
	        if (data.searchPoiInfo.pois.poi.length > 0) {
	            const poi = data.searchPoiInfo.pois.poi[0];
	            return { lat: parseFloat(poi.frontLat), lon: parseFloat(poi.frontLon) };
	        } else {
	            return null;
	        }
	    } catch (error) {
	        console.error("좌표 가져오기 실패:", error);
	        return null;
	    }
	}
