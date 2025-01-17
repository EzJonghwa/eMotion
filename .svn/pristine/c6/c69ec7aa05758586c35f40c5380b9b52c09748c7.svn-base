<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.List" %>
<%@ page import="com.eMotion.team.map.controller.mapController.StationPoint" %>
<head>
  <meta charset="utf-8">
  <style>
    .day-button {
      padding: 10px 15px;
      margin: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f0f0f0;
      cursor: pointer;
      font-size: 16px;
    }
    .day-button.active {
      background-color: #007BFF; /* 활성화된 버튼 색 */
      color: white;
      border-color: #0056b3;
    }
  </style>
</head>
<body style="height: 100%; margin: 0">
  <div style="text-align: center; margin-bottom: 10px;">
    <button class="day-button" id="btn-0" onclick="updateChart('0')">일</button>
    <button class="day-button" id="btn-1" onclick="updateChart('1')">월</button>
    <button class="day-button" id="btn-2" onclick="updateChart('2')">화</button>
    <button class="day-button" id="btn-3" onclick="updateChart('3')">수</button>
    <button class="day-button" id="btn-4" onclick="updateChart('4')">목</button>
    <button class="day-button" id="btn-5" onclick="updateChart('5')">금</button>
    <button class="day-button" id="btn-6" onclick="updateChart('6')">토</button>

  </div>
  <div id="container" style="height: 300px; width: 100%; visibility: visible;"></div>
  

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="https://fastly.jsdelivr.net/npm/echarts@5.6.0/dist/echarts.min.js"></script>

  
  <script>
  
    var app = {};

    var xAxisData = ['00','01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'];

	var todayData = [];
	var data0 = [];
	var data1 = [];
	var data2 = [];
	var data3 = [];
	var data4 = [];
	var data5 = [];
	var data6 = [];


	
	var chartData = {
	  'todayData': { x: xAxisData, y: todayData },
	  '0': { x: xAxisData, y: data0 },
	  '1': { x: xAxisData, y: data1 },
	  '2': { x: xAxisData, y: data2 },
	  '3': { x: xAxisData, y: data3 },
	  '4': { x: xAxisData, y: data4 },
	  '5': { x: xAxisData, y: data5 },
	  '6': { x: xAxisData, y: data6 }
	};


	var selectedDay = '';
	var today = new Date().getDay();
	
	var statid = '${statid}';
	var myChart; // 전역 변수 선언
	
	$(document).ready(function () {

		  var dom = document.getElementById('container');
		  myChart = echarts.init(dom, null, {
		    renderer: 'canvas',
		    useDirtyRect: false
		  });

		  // AJAX 요청을 보내서 차트 데이터를 로드하고, 차트를 설정합니다.
		  $.ajax({
		    url: '/map/getChart',
		    type: 'GET',
		    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		    data: {
		      statid: statid,
		      day: today
		    },
		    success: function (response) {
		      console.log(response);
		      for (var i = 0; i < response.length; i++) {
		        todayData.push(response[i].useRatio); // useRatio 값을 data0 배열에 추가
		      }
		      var option = {
		        title: {},
		        legend: {
		          data: ['이용률']
		        },
		        toolbox: {
		          feature: {
		            magicType: { type: ['stack'] },
		            dataView: {},
		            saveAsImage: { pixelRatio: 2 }
		          }
		        },
		        tooltip: {},
		        xAxis: {
		          data: xAxisData,
		          splitLine: { show: false }
		        },
		        yAxis: { min: 0, max: 100 },
		        series: [{
		          name: 'bar',
		          type: 'bar',
		          data: chartData['todayData'].y,
		          emphasis: { focus: 'series' },
		          animationDelay: function (idx) { return idx * 50; }
		        }],
		        animationEasing: 'elasticOut',
		        animationDelayUpdate: function (idx) { return idx * 5; }
		      };

		      // myChart 설정
		      if (option && typeof option === 'object') {
		        myChart.setOption(option);

		        myChart.resize();
		        // 버튼 활성화 상태 업데이트
		        updateButtonState(today); // 버튼 활성화는 차트 설정 이후에 호출
		      }

		      console.log(todayData);
		    },
		    error: function (error) {
		      console.error('응답 실패!');
		    }
		  });

		  // 창 크기 변경 시 차트 크기 조정
		  window.addEventListener('resize', myChart.resize);

		});
  // 차트 업데이트 함수
  function updateChart(day) {
    selectedDay = day;
    $.ajax({
        url: '/map/getChart', // 서버 엔드포인트
        type: 'GET', // POST 요청
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: {
            statid: statid,
            day: day
        },
        success: function(response) {
            console.log('응답 데이터:', response);

            // day 값에 해당하는 배열 선택 (예: data0, data1, ...)
            var targetData = chartData[day].y;

            // 서버 응답 데이터를 선택된 배열에 추가
            response.forEach(item => targetData.push(item.useRatio));

            console.log(`chartData[${day}]:`, chartData[day]);

            // 차트 옵션 업데이트
            var newOption = {
                title: { text: `요일 ${day} 차트` },
                xAxis: { data: chartData[day].x },
                series: [
                    {
                        name: 'bar',
                        type: 'bar',
                        data: targetData // 선택된 요일 데이터 사용
                    }
                ]
            };

            // 차트 업데이트
            myChart.setOption(newOption);

            // 버튼 활성화 상태 업데이트
            updateButtonState(day);
        },
        error: function(error) {
            console.error('응답실패!');
        }
    });
}

  
  // 버튼 활성화 업데이트
 function updateButtonState(activeDay) {
  console.log('활성화할 day:', activeDay); // 디버깅용 로그 추가
  var buttons = document.querySelectorAll('.day-button');
  buttons.forEach(button => {
    button.classList.remove('active');
  });
  var activeButton = document.getElementById('btn-' + activeDay);
  if (activeButton) {
    activeButton.classList.add('active');
  } else {
    console.error('ID가 btn-' + activeDay + '인 버튼을 찾을 수 없습니다.');
  }
}

  </script>
</body>
</html>