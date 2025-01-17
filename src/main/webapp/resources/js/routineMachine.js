	
          		// 머신 러닝 부분
          	    const onemonth = 4.34;
          	    const sixmonth = 26;
          	    const oneyear = 52;

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
          	        var average = parseFloat(document.getElementById('average-${routine.routineNo}').value); // 평균 연료 가격
          	        var elec = parseFloat(document.getElementById('elec-${routine.routineNo}').value); // 전기차 충전 비용
          	        var predictionType = document.getElementById('prediction_type-${routine.routineNo}').value; // 선택된 예측 기간
          	        

          	        // 유효성 검사
          	        if (isNaN(totalDis) || isNaN(gasCarEff) || isNaN(eleCarEff) || isNaN(average) || isNaN(elec)) {
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
          	        var gastotal = (totalDis / gasCarEff) * average * multiplier; // 내연기관 연료비
          	        var electotal = (totalDis / eleCarEff) * elec * multiplier;  // 전기차 연료비
          	        var minustotal = (gastotal-electotal)

          	        let howto;
          	        if (eleCarPrice >= gasCarPrice) {
          	        var minusprice = eleCarPrice - gasCarPrice;
          	        document.getElementById('minus-price-${routine.routineNo}').innerHTML = "두 차량의 가격 차이는 " + ${minusprice};

          	        // 선택된 predictionType에 따라 howto 계산
          	        if (predictionType === '1_month') {
          	            howto = (minusprice / minustotal) / 12;
          	        } else if (predictionType === '6_months') {
          	            howto = (minusprice / minustotal) / 2;
          	        } else if (predictionType === '12_months') {
          	            howto = minusprice / minustotal;
          	        }

          	        document.getElementById('howto-${routine.routineNo}').innerHTML = "차량 가격 회복까지 " + ${howto.toFixed(2)} + "년";}
          	        else {
          	        document.getElementById('minus-price-${routine.routineNo}').innerHTML = "전기차 > 내연차";
          	    }


          	        // 결과 표시
          	        document.getElementById('gastotal-${routine.routineNo}').innerText = "내연기관 총 비용:" + ${gastotal.toFixed(2)} + "원";
          	        document.getElementById('electotal-${routine.routineNo}').innerText = "전기차 총 비용:" + ${electotal.toFixed(2)} + "원";
          	        document.getElementById('minus-${routine.routineNo}').innerHTML = "절감 :" + ${minustotal.toFixed(2)}+ "원";
          	    });

          	    // Charge Type 설정 함수
          	    function setChargeType(value) {
          	            document.getElementById('selectedChargeType-${routine.routineNo}').innerText = value ? value : "없음"; // 선택된 값을 표시
          	        }
          	    // Prediction Type 설정 함수
          	    function setPredictionType(value) {
          	            document.getElementById('selectedPredictionType-${routine.routineNo}').innerText = value ? value : "없음"; // 선택된 값을 표시
          	        }

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
                                       "<div class='col'><p>연료 타입:" + ${data1.charge_type} + "</p></div>"+
                                   "</div>"+
                                   "<div class='row'> "+
                                       "<div class='col'>"+
                                           "<p>출발지:" + ${region1} + "</p>"+
                                           "<p>도착지:" + ${region2} + "</p>"+
                                       "</div>"+
                                  " </div>"+
                                  " <div class='row'>"+
                                       "<div class='col'>"+
                                           "<p>" + ${predictionLabel} + "예측 :" + ${avgPrediction} + "원</p>"+
                                       "</div>"+
                                   "</div>";
                              // 평균값을 <input id="average">에 표시
                              document.getElementById('average-${routine.routineNo}').value = avgPrediction.toFixed(2);
                         }
                     });
                 });
          		//충전소 필터링 및 리스트 출력
          		//경로 계산 및 표시 함수
  