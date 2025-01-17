<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=hK16EQ22PI8xceOsMCRZI6GSYMhAaI2s9pmKiS2M"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <title>Fuel Price Prediction</title>
    <style>
        .active {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    
    <div class="row"><h1>총 운행거리 :<span id="totalDis-${routine.routineNo}">92.9</span>km</h1></div>
<i class="bi bi-x-lg"></i>

    <div class="row">
        <div class="col fs-1">내연기관 가격: <span id="gascarprice-${routine.routineNo}">31400000</span></div>
        <div class="col fs-1">전기차 가격: <span id="eleccarprice-${routine.routineNo}">47000000</span></div>
    </div>

    <div class="row">
        <div class="col fs-1">내연기관 연비: <span id="gaseff-${routine.routineNo}">7.44</span></div>
        <div class="col fs-1">전기차 연비: <span id="eleceff-${routine.routineNo}">31.42</span></div>
    </div>
    <div class="row">
       
        <div class="col">
           
            <!-- 입력 폼 -->
            <form id="predictionForm-${routine.routineNo}">  
                <label for="charge_type" class="form-label">Charge Type 선택</label>
                <select class="form-select" id="charge_type-${routine.routineNo}">
                    <option value="">선택하세요</option>
                    <option value="보통 휘발유">보통 휘발유</option>
                    <option value="고급 휘발유">고급 휘발유</option>
                    <option value="LPG">LPG</option>
                    <option value="경유">경유</option>
                </select>
        
                <label for="prediction_type" class="form-label">Prediction Type 선택</label>
                <select class="form-select" id="prediction_type-${routine.routineNo}">
                    <option value="">선택하세요</option>
                    <option value="1_month">한달</option>
                    <option value="6_months">6개월</option>
                    <option value="12_months">1년</option>
                </select>
        
                <button class="btn btn-warning" type="button" id="getPredictionBtn-${routine.routineNo}">Get Prediction</button>
            </form>
        
        
            <div id="predictionResult-${routine.routineNo}">
            </div>


        </div>


            <div class="col">
                <h1 class="mb-5">[급속] 정림주유소 전기차충전소</h1>
                <div id="elecmember-${routine.routineNo}" class="mb-5" style="border-radius: 10px; background-color: antiquewhite; height: 100px;"><h2> 회원가 : <span>347</span> </h2></div>
                
                <div id="elecnonmember-${routine.routineNo}" style="border-radius: 10px; background-color: antiquewhite; height: 100px;"><h2> 비회원가 : <span>448</span> </h2></div>
                
                
                </div>
    
    </div>

<div class="row">
    <div class="col"><input class="form-control" id="average-${routine.routineNo}"></div>
    <div class="col"><input class="form-control"id="elec-${routine.routineNo}"></div>
        <button class="btn btn-primary" id="culculprice-${routine.routineNo}">계산</button>
</div>
<div class="row">
    <div class="col" id="gastotal-${routine.routineNo}"></div>
    <div class="col" id="electotal-${routine.routineNo}"></div>
</div>
<div class="row">
    <div class="col" id="minus-${routine.routineNo}"></div>
</div>

<div class="row">
    <div class="col" id="minus-price-${routine.routineNo}"></div>
</div>
<div class="row">
    <div class="col" id="howto-${routine.routineNo}"></div>
</div>
</div>
    
        <!-- 예측 결과가 여기에 표시됩니다 -->
<script>
// 전기차 충전소의 회원가와 비회원가 div 클릭 시 처리하는 함수
var onemonth = 4.34;
var sixmonth = 26;
var oneyear = 52;

// 전기차 충전소의 회원가와 비회원가 div 클릭 시 처리하는 함수
document.getElementById('elecmember-${routine.routineNo}').addEventListener('click', function () {
    var memberPrice = this.querySelector('span').innerText; // span의 값 가져오기
    document.getElementById('elec-${routine.routineNo}').value = memberPrice; // <input id="elec">에 값 설정
});

document.getElementById('elecnonmember-${routine.routineNo}').addEventListener('click', function () {
    var nonMemberPrice = this.querySelector('span').innerText; // span의 값 가져오기
    document.getElementById('elec-${routine.routineNo}').value = nonMemberPrice; // <input id="elec">에 값 설정
});

// '계산' 버튼 클릭 시 처리하는 함수
document.getElementById('culculprice-${routine.routineNo}').addEventListener('click', function () {
    // 필요한 값 가져오기
    var totalDis = parseFloat(document.getElementById('totalDis-${routine.routineNo}').innerText); // 총 운행거리
    var gaseff = parseFloat(document.getElementById('gaseff-${routine.routineNo}').innerText); // 내연기관 연비
    var eleceff = parseFloat(document.getElementById('eleceff-${routine.routineNo}').innerText); // 전기차 연비
    var average = parseFloat(document.getElementById('average-${routine.routineNo}').value); // 평균 연료 가격
    var elec = parseFloat(document.getElementById('elec-${routine.routineNo}').value); // 전기차 충전 비용
    var predictionType = document.getElementById('prediction_type-${routine.routineNo}').value; // 선택된 예측 기간
    

    // 유효성 검사
    if (isNaN(totalDis) || isNaN(gaseff) || isNaN(eleceff) || isNaN(average) || isNaN(elec)) {
        alert('모든 값을 입력하거나 선택해주세요!');
        return;
    }

    // 선택된 예측 기간에 따라 기간 값을 설정
    let multiplier = 1;
    if (predictionType === '1_month') {
        multiplier = onemonth;
    } else if (predictionType === '6_months') {
        multiplier = sixmonth;
    } else if (predictionType === '12_months') {
        multiplier = oneyear;
    }

    // 계산
    var gascarprice = parseFloat(document.getElementById('gascarprice-${routine.routineNo}').innerText);
    var eleccarprice = parseFloat(document.getElementById('eleccarprice-${routine.routineNo}').innerText);
    var gastotal = (totalDis / gaseff) * average * multiplier; // 내연기관 연료비
    var electotal = (totalDis / eleceff) * elec * multiplier;  // 전기차 연료비
    var minustotal = (gastotal-electotal)

    let howto;
    if (eleccarprice >= gascarprice) {
    var minusprice = eleccarprice - gascarprice;
    document.getElementById('minus-price-${routine.routineNo}').innerHTML = `두 차량의 가격 차이는 ${minusprice}`;

    // 선택된 predictionType에 따라 howto 계산
    if (predictionType === '1_month') {
        howto = (minusprice / minustotal) / 12;
    } else if (predictionType === '6_months') {
        howto = (minusprice / minustotal) / 2;
    } else if (predictionType === '12_months') {
        howto = minusprice / minustotal;
    }

    document.getElementById('howto-${routine.routineNo}').innerHTML = `차량 가격 회복까지 ${howto.toFixed(2)} 년`;}
    else {
    document.getElementById('minus-price-${routine.routineNo}').innerHTML = `전기차 > 내연차`;
}


    // 결과 표시
    document.getElementById('gastotal-${routine.routineNo}').innerText = `내연기관 총 비용: ${gastotal.toFixed(2)} 원`;
    document.getElementById('electotal-${routine.routineNo}').innerText = `전기차 총 비용: ${electotal.toFixed(2)} 원`;
    document.getElementById('minus-${routine.routineNo}').innerHTML = `절감 : ${minustotal.toFixed(2)}원`
});


    // 예측 기간을 한국어 문자열로 변환
    function getPredictionLabel(predictionType) {
        switch (predictionType) {
            case '1_month':
                return '한달';
            case '6_months':
                return '6개월';
            case '12_months':
                return '1년';
            default:
                return predictionType;
        }
    }

    // 예측 결과를 가져오고 페이지 새로고침 없이 결과를 화면에 표시
    document.getElementById('getPredictionBtn-${routine.routineNo}').addEventListener('click', function() {
        // 입력값 가져오기
        var chargeType = document.getElementById('charge_type-${routine.routineNo}').value;
        var predictionType = document.getElementById('prediction_type-${routine.routineNo}').value;
        

        if (!chargeType || !predictionType) {
            alert('모든 값을 선택해주세요!');
            return;
        }

        var modelType = 'Transformer';
        var region1 = '대전';
        var region2 = '서울';

        var requestData1 = {
            model_type: modelType,
            region: region1,
            charge_type: chargeType
        };
        var requestData2 = {
            model_type: modelType,
            region: region2,
            charge_type: chargeType
        };

        Promise.all([
            fetch('http://192.168.0.86:5000/predict', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(requestData1)
            }).then(response => response.json()),
            fetch('http://192.168.0.86:5000/predict', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(requestData2)
            }).then(response => response.json())
        ])
        .then(([data1, data2]) => {
            // 예측 결과 표시
            if (data1.error || data2.error) {
                document.getElementById('predictionResult-${routine.routineNo}').innerText = "Error:" + ${data1.error || data2.error};
            } else {
                var region1Prediction = data1.predictions[predictionType];
                var region2Prediction = data2.predictions[predictionType];
                var avgPrediction = (region1Prediction + region2Prediction) / 2;
                var predictionLabel = getPredictionLabel(predictionType);
                document.getElementById('predictionResult-${routine.routineNo}').innerHTML = 
                	"<div class='row'>"+
                        "<div class='col'><p>연료 타입:" + data1.charge_type + "</p></div>" +
                    "</div>"+
                    "<div class='row'>" +
                        "<div class='col'>"+
                            "<p>출발지:" + region1 + "</p>" +
                            "<p>도착지:" + region2 + "</p>" +
                      "</div>" +
                   "</div>"+
                   " <div class='row'>"+
                        "<div class='col'>"+
                            "<p>" + predictionLabel + "예측 :" + avgPrediction + "원</p>" +
                        "</div>" +
                    "</div>";
                 // 평균값을 <input id="average">에 표시
                 console.log(modelType,region1,region2,chargeType,predictionType);
                            document.getElementById('average-${routine.routineNo}').value = avgPrediction.toFixed(2);
            };
                 
        });
    });</script>


</body>

</html>