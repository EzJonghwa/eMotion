
$(document).ready(function(){
	var dom = document.getElementById('container');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var app = {};

    var xAxisData = ['00','01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'];

	var data0 = [10,10,10,50,30,40,50,60,60,60,10,10,10,20,30,40,50,60,70,10,10,10,20,30,60];
	var data1 = [0,0,10,50,30,40,50,60,60,60,10,10,10,20,30,40,50,60,70,10,10,10,20,30,60];
	var data2 = [10,10,10,50,30,0,0,60,60,60,10,10,10,20,30,40,50,60,70,10,10,10,20,30,60];
	var data3 = [10,10,10,50,30,40,50,60,60,0,0,10,10,20,30,40,50,60,70,10,10,10,20,30,60];
	var data4 = [10,10,10,50,30,40,50,60,60,60,10,10,10,20,0,0,50,60,70,10,10,10,20,30,60];
	var data5 = [10,10,10,50,30,40,50,60,60,60,10,10,10,20,30,40,50,60,0,0,0,10,20,30,60];
	var data6 = [10,10,10,50,30,40,50,60,60,60,10,10,10,20,30,40,50,60,70,10,10,10,0,0,0];


	
	var chartData = {
	  'sun': { x: xAxisData, y: data0 },
	  'mon': { x: xAxisData, y: data1 },
	  'tue': { x: xAxisData, y: data2 },
	  'wed': { x: xAxisData, y: data3 },
	  'thu': { x: xAxisData, y: data4 },
	  'fri': { x: xAxisData, y: data5 },
	  'sat': { x: xAxisData, y: data6 }
	};


	var days = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];
	var today = new Date().getDay();
	var todayDay = days[today];
	var statid = 'HM000681';
	
	$.ajax({
	    url: '/map/getChart', // 서버 엔드포인트
	    type: 'GET', // POST 요청
	    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
	    data: {
	    	statid: statid,
	        day: today
	    },
	    success: function (response) {
	        console.log('응답성공!');
	    },
	    error: function (error) {
	        console.error('응답실패!');
	    }
	});
	

var option = {
  title: {},
  legend: {
    data: ['이용률']
  },
  toolbox: {
    // y: 'bottom',
    feature: {
      magicType: {
        type: ['stack']
      },
      dataView: {},
      saveAsImage: {
        pixelRatio: 2
      }
    }
  },
  tooltip: {},
  xAxis: {
    data: xAxisData,
    splitLine: {
      show: false
    }
  },
  yAxis: {
    min: 0,
    max: 100
  },
  series: [
    {
      name: 'bar',
      type: 'bar',
      data: chartData[todayDay].y,
      emphasis: {
        focus: 'series'
      },
      animationDelay: function (idx) {
        return idx * 50;
      }
    },
    
  ],
  animationEasing: 'elasticOut',
  animationDelayUpdate: function (idx) {
    return idx * 5;
  }
};

    if (option && typeof option === 'object') {
      myChart.setOption(option);
      updateButtonState(todayDay); 
    }

 // 차트 업데이트 함수
 function updateChart(day) {
      var newData = chartData[day];
      var newOption = {
        title: {},
        xAxis: { data: newData.x },
        series: [
          {
            type: 'bar',
            data: newData.y
          }
        ]
      };
      myChart.setOption(newOption);
      updateButtonState(day);
    }
// 버튼 활성화 업데이트
function updateButtonState(activeDay) {
  var buttons = document.querySelectorAll('.day-button');
  buttons.forEach(button => {
    button.classList.remove('active');
  });
  document.getElementById(`btn-${activeDay}`).classList.add('active');
}

    window.addEventListener('resize', myChart.resize);
    

});
