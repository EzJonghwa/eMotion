        // 전기차 충전소의 회원가와 비회원가 div 클릭 시 처리하는 함수
    const onemonth = 4.34;
    const sixmonth = 26;
    const oneyear = 52;

    // 전기차 충전소의 회원가와 비회원가 div 클릭 시 처리하는 함수
    document.getElementById('elecmember-${routine.routineNo}').addEventListener('click', function () {
        const memberPrice = this.querySelector('span').innerText; // span의 값 가져오기
        document.getElementById('elec-${routine.routineNo}').value = memberPrice; // <input id="elec">에 값 설정
    });

    document.getElementById('elecnonmember-${routine.routineNo}').addEventListener('click', function () {
        const nonMemberPrice = this.querySelector('span').innerText; // span의 값 가져오기
        document.getElementById('elec-${routine.routineNo}').value = nonMemberPrice; // <input id="elec">에 값 설정
    });

    // '계산' 버튼 클릭 시 처리하는 함수
    document.getElementById('culculprice-${routine.routineNo}').addEventListener('click', function () {
        // 필요한 값 가져오기
        const totalDis = parseFloat(document.getElementById('totalDis-${routine.routineNo}').innerText); // 총 운행거리
        const gaseff = parseFloat(document.getElementById('gaseff-${routine.routineNo}').innerText); // 내연기관 연비
        const eleceff = parseFloat(document.getElementById('eleceff-${routine.routineNo}').innerText); // 전기차 연비
        const average = parseFloat(document.getElementById('average-${routine.routineNo}').value); // 평균 연료 가격
        const elec = parseFloat(document.getElementById('elec-${routine.routineNo}').value); // 전기차 충전 비용
        const predictionType = document.getElementById('prediction_type-${routine.routineNo}').value; // 선택된 예측 기간
        

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
        const gascarprice = parseFloat(document.getElementById('gascarprice-${routine.routineNo}').innerText);
        const eleccarprice = parseFloat(document.getElementById('eleccarprice-${routine.routineNo}').innerText);
        const gastotal = (totalDis / gaseff) * average * multiplier; // 내연기관 연료비
        const electotal = (totalDis / eleceff) * elec * multiplier;  // 전기차 연료비
        const minustotal = (gastotal-electotal)

        let howto;
        if (eleccarprice >= gascarprice) {
        const minusprice = eleccarprice - gascarprice;
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
            const chargeType = document.getElementById('charge_type-${routine.routineNo}').value;
            const predictionType = document.getElementById('prediction_type-${routine.routineNo}').value;

            if (!chargeType || !predictionType) {
                alert('모든 값을 선택해주세요!');
                return;
            }

            const modelType = 'Transformer';
            const region1 = '대전';
            const region2 = '서울';

            const requestData1 = {
                model_type: modelType,
                region: region1,
                charge_type: chargeType
            };
            const requestData2 = {
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
                    document.getElementById('predictionResult-${routine.routineNo}').innerText = `Error: ${data1.error || data2.error}`;
                } else {
                    const region1Prediction = data1.predictions[predictionType];
                    const region2Prediction = data2.predictions[predictionType];
                    const avgPrediction = (region1Prediction + region2Prediction) / 2;
                    const predictionLabel = getPredictionLabel(predictionType);

                    document.getElementById('predictionResult-${routine.routineNo}').innerHTML = `
                        <div class='row'>
                            <div class='col'><p>연료 타입: ${data1.charge_type}</p></div>
                        </div>
                        <div class='row'> 
                            <div class='col'>
                                <p>출발지: ${region1}</p>
                                <p>도착지: ${region2}</p>
                            </div>
                        </div>
                        <div class='row'>
                            <div class='col'>
                                <p>${predictionLabel} 예측 : ${avgPrediction} 원</p>
                            </div>
                        </div>
                    `;
                     // 평균값을 <input id="average">에 표시
                     document.getElementById('average-${routine.routineNo}').value = avgPrediction.toFixed(2);
                }
            });
        });