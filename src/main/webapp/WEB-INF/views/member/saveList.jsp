
<%
  /* ================================================================= 
   * 작성일     : 2024. 12. 16. 
   * 작성자     : 철규
   * 상세설명  : 회원가입
   * 화면ID : 
   * ================================================================= 
   * 수정일         작성자             내용      
   * ----------------------------------------------------------------------- 
   * 
   * ================================================================= 
   */
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Input</title>

<!-- 프레임 워크 jquery and bootStrap-->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"	crossorigin="anonymous">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- 헤더 풋터 css -->
<link rel="stylesheet" href="/resources/css/headerFooter.css">
<!-- 헤더 풋터 css -->

</head>
<style>

.responsive-text {
	font-size: calc(1rem + 0.5vw);
	/* 화면 너비에 비례한 폰트 크기 */
}
.responsive-subtext {
	font-size: calc(1rem + 0.5vw);
	font-weight: 600;
	color: #604616;
	/* 화면 너비에 비례한 폰트 크기 */
}
.responsive-tabletext{
	font-size: calc(0.6rem + 0.5vw);
}

.responsive-input {
	font-size: calc(1rem + 0.5vw);
	height: 7vh;
	/* 화면 너비에 비례한 폰트 크기 */
}

.hidden{
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
}
		
/* 테이블 컨테이너에 스크롤 추가 */
.table-wrapper {
    flex-grow: 1; /* 부모의 남은 공간 채우기 */
    max-height: 100%; /* maingrid의 높이에 맞춤 */
    overflow-y: auto; /* 세로 스크롤 활성화 */
    padding: 10px;
}
      
#resultList {
    max-height: 200px; /* 최대 높이 설정 */
    overflow-y: auto; /* 스크롤 추가 */
    background-color: white; /* 리스트 배경색 */
    position: absolute; /* 위치 고정 */
    top: 100%; /* 인풋창 바로 아래에 표시 */
    left: 0; /* 부모의 왼쪽에 맞춤 */
    width: 100%; /* 부모의 너비에 맞춤 */
    border: 1px solid #ccc; /* 테두리 추가 */
    z-index: 1050; /* 다른 요소 위에 표시 */
    border-radius: 0.25rem; /* 둥근 테두리 */
    display: none; /* 기본적으로 숨김 */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}      
.like-icon {
	width: 24px;
	height: 24px;
	cursor: pointer;
	transition: fill 0.3s;
}
.like-icon:hover {
	fill: #FFA500; /* 호버 시 주황색 강조 */
}
.like-icon.active {
	fill: #FFD700; /* 활성화된 상태는 금색 */
}

/* 버튼의 셀렉 상태 */
.btn-selected {
	background-color: #FFD700; /* 금색 */
	color: #ffffff; /* 흰색 텍스트 */
	border-color: #FFD700;
	/*cursor: not-allowed; /* 클릭 불가 상태 */
	/*pointer-events: none; /* 클릭 이벤트 차단 */
	opacity: 0.65; /* 비활성화 상태처럼 보이도록 */
}
</style>

<style>
.mainbody {
	background-color: #ffffff;
}

.btn_log {
	border-radius: 10px;
	padding: 12px 15px;
	width: 100%;
	height: 100px;
}

.log {
	height: 100px;
	margin-bottom: 10px;
	border-radius: 20px
}

.log_last {
	height: 100px;
	border-radius: 20px
}

.btn-primary {
	background-color: #50B0FF;
	border: none;
}

.btn-primary:hover {
	background-color: #37a1f8;
}

.btn-primary:active {
	background-color: #50B0FF;
}

a {
	color: #37a1f8;
}
</style>
<style>
/* 화면 꽉차게 */
html, body {
    height: 100%;
}

body {
    display: flex;
    justify-content: center;
    background-color: #f8f9fa;
}

.cont::-webkit-scrollbar {
    display: none;
}

.cont {
    background-color: white;
    width: 744px;
    height: 100%;
    -ms-overflow-style: none;
    scrollbar-width: none;
}


.re_sm_logo_modal {
    font-size: 2rem;
    font-weight: 600;
    color: #828282;
}

.inp_size {
    border-radius: 15px;
    height: 11vh;
    min-height: 60px;
    max-height: 80px;
}


.btn-primary {
    font-weight: 1000;
    background-color: #50B0FF;
    border: none;
}

.btn-primary:hover {
    background-color: #37a1f8;
}

.btn-size {
    border-radius: 10px;
    width: 100%;
    height: 10vh;
    min-height: 50px;
    max-height: 100px;
    font-weight: 600;
}

.input-group {
    height: 4rem;
    margin-bottom: 0.5rem;
}

.error-message {
    color: #dc3545;
    font-weight: 600;
    margin-left: 0.25rem;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('searchInput');
    const resultList = document.getElementById('resultList');
    const tableBody = document.getElementById('modalTableBody');
    const submitButton = document.querySelector('#carForm button[type="submit"]');
    const carBuyDateInput = document.getElementById('carBuyDate');
    const modal = document.getElementById('exampleModal');
    let selectedType = '';
    let currentRow = null; // 현재 테이블에 추가된 행을 저장

    // 초기 상태에서 입력창 비활성화
    searchInput.disabled = true;
    submitButton.disabled = true;

    // 차량 유형 버튼 클릭 이벤트
    document.querySelectorAll('.car-type-btn').forEach(function(button) {
        button.addEventListener('click', function() {
            document.querySelectorAll('.car-type-btn').forEach(function(btn) {
                btn.classList.remove('active');
            });
            button.classList.add('active');
            selectedType = button.getAttribute('data-type');

            // 검색 입력창 및 결과 초기화
            searchInput.value = '';
            resultList.innerHTML = '';
            resultList.style.display = 'none';
            searchInput.disabled = false;
        });
    });

    // Debounce 함수 정의
    function debounce(func, delay) {
        let timer;
        return function(...args) {
            clearTimeout(timer);
            timer = setTimeout(() => func.apply(this, args), delay);
        };
    }

    // 검색 입력 이벤트 핸들러
    const handleInput = debounce(async function(event) {
        const keyword = event.target.value.trim();

        if (keyword.length === 0 || selectedType === '') {
            resultList.style.display = 'none';
            return;
        }

        try {
            const response = await fetch('/carSearch?keyword=' + encodeURIComponent(keyword) + '&carType=' + encodeURIComponent(selectedType));
            if (!response.ok) throw new Error('요청 실패');
            const carList = await response.json();

            console.log('초기화 전 결과 수:', resultList.children.length);
            resultList.innerHTML = '';
            resultList.style.display = 'block';
            console.log('초기화 후 결과 수:', resultList.children.length);

            carList.forEach(function(car) {
                const li = document.createElement('li');
                li.className = 'list-group-item list-group-item-action';
                li.textContent = car.carName;
                li.dataset.carName = car.carName;

                li.addEventListener('click', function() {
                    checkAndAddCar(car.carName, selectedType);
                });

                resultList.appendChild(li);
            });
        } catch (error) {
            console.error('에러 발생:', error);
            resultList.style.display = 'none';
        }
    }, 300); // 300ms 지연

    // 검색 입력 이벤트 연결
    searchInput.addEventListener('input', handleInput);

    // 중복 확인 및 추가 함수
    function checkAndAddCar(carName, carType) {
        $.ajax({
            type: 'POST',
            url: '/carNameCheck',
            data: {
                carName: carName,
                carType: carType
            },
            success: function(cnt) {
                if (cnt === 0) {
                    addCarToTable(carName, carType); // 테이블에 추가
                    resultList.style.display = 'none';
                    searchInput.value = '';
                    document.getElementById('emailError').textContent = '';
                } else {
                    document.getElementById('emailError').textContent = '이미 추가된 차량입니다.';
                    setTimeout(() => {
                        document.getElementById('emailError').textContent = ''; // 메시지 초기화
                    }, 3000); // 3초 후 메시지 제거
                }
            },
            error: function() {
                document.getElementById('emailError').textContent = '중복 확인 중 오류가 발생했습니다.';
                setTimeout(() => {
                    document.getElementById('emailError').textContent = ''; // 메시지 초기화
                }, 3000); // 3초 후 메시지 제거
            }
        });
    }

    // 테이블에 차량 추가 함수
    function addCarToTable(carName, carType) {
        if (currentRow) {
            currentRow.remove();
        }

        const newRow = document.createElement('tr');
        newRow.className = 'table-light';
        newRow.innerHTML = 
            "<td><input class='form-check-input' type='checkbox'></td>" +
            "<td>" + carName + "</td>" +
            "<td><button class='btn btn-danger btn-sm delete-row'>X</button></td>" +
            "<td style='display:none;'>" +
                "<input type='hidden' name='carType' value='" + carType + "'>" +
                "<input type='hidden' name='carName' value='" + carName + "'>" +
            "</td>";
        tableBody.appendChild(newRow);
        currentRow = newRow;

        // X 버튼 삭제 이벤트
        newRow.querySelector('.delete-row').addEventListener('click', function() {
            newRow.remove();
            currentRow = null;
            updateSubmitButtonState(); // 상태 업데이트
        });

        updateSubmitButtonState(); // 상태 업데이트
    }

    // 버튼 활성화/비활성화 상태 업데이트 함수
    function updateSubmitButtonState() {
        const checkboxes = document.querySelectorAll('#modalTableBody .form-check-input');
        let isChecked = false;

        // 체크박스 중 하나라도 체크되었는지 확인
        checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                isChecked = true;
            }
        });

        // 구매일 입력 여부 확인
        const isDateFilled = carBuyDateInput.value.trim() !== '';

        // 체크박스가 선택되었고 구매일도 입력된 경우에만 버튼 활성화
        submitButton.disabled = !(isChecked && isDateFilled);
    }

    // 체크박스 상태 변경 이벤트 추가
    document.getElementById('modalTableBody').addEventListener('change', updateSubmitButtonState);

    // 구매일 입력 필드 상태 변경 이벤트 추가
    carBuyDateInput.addEventListener('input', updateSubmitButtonState);

    // 검색창 외부 클릭 시 리스트 숨김
    searchInput.addEventListener('blur', function() {
        setTimeout(function() {
            resultList.style.display = 'none';
        }, 200);
    });

    // 검색창에서 다시 포커스를 얻으면 리스트 표시
    searchInput.addEventListener('focus', function() {
        if (resultList.children.length > 0) {
            resultList.style.display = 'block';
        }
    });

    // 모달 초기화 이벤트
    modal.addEventListener('hidden.bs.modal', function() {
        // 폼 데이터 초기화
        document.getElementById('carForm').reset();

        // 검색창 및 결과 초기화
        searchInput.value = '';
        resultList.innerHTML = '';
        resultList.style.display = 'none';
        searchInput.disabled = true;

        // 테이블 데이터 초기화
        tableBody.innerHTML = '';
        currentRow = null;

        // 차량 유형 버튼 초기화
        document.querySelectorAll('.car-type-btn').forEach(function(btn) {
            btn.classList.remove('active');
        });
        selectedType = '';

        // 버튼 비활성화
        submitButton.disabled = true;

        console.log('모달이 닫히고 모든 데이터가 초기화되었습니다.');
    });
});


// 리스트 불러오기 및 삭제 및 중요 표시
document.addEventListener('DOMContentLoaded', function () {
    // 요소 가져오기
    const eCarTableBody = document.getElementById('eCarTableBody');
    const gCarTableBody = document.getElementById('gCarTableBody');
    const notOwnedBtn = document.getElementById('notOwnedBtn');
    const notOwnerStatus = document.getElementById('notOwnerStatus');
    const confirmModal = new bootstrap.Modal(document.getElementById('confirmModal'));
    const confirmDeleteBtn = document.getElementById('confirmDeleteBtn');

    // 데이터 로드
    loadCarList('/eSaveCarList', eCarTableBody, 'haveecar', '/eImpCar'); // 전기차 리스트
    loadCarList('/gSaveCarList', gCarTableBody, 'havegcar', '/gImpCar'); // 내연기관차 리스트

 	// 초기 상태 확인
    let blockPageTransition = false; // 페이지 전환 차단 변수
    let navigateTo = ""; // 이동하려는 URL 저장 변수

 	// 페이지 로드 시 초기 상태 추가
    window.history.pushState(null, null, window.location.href);
    
    // 초기 상태 확인
    fetch('/getSaveCarStatus', {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        console.log(data);
        console.log(data.saveCar);
        console.log(data.notOwner);

        // 버튼 및 상태 초기화
        updateButtonAndStatus(data);

        // 페이지 전환 차단 조건 설정
        if (data.saveCar === 'N' && data.notOwner === 'N') {
            blockPageTransition = true; // 전환 차단 활성화
            console.log(blockPageTransition);
        }
    })
    .catch(error => {
        console.error('Error fetching saveCar status:', error);
    });

    // 특정 클릭 이벤트 감지 (data-href 사용)
    $(document).on("click", ".navigate-link", function (e) {
        e.preventDefault(); // 기본 이동 방지
        navigateTo = $(this).data("href"); // data-href 값 가져오기
        console.log("Navigate to set:", navigateTo);

        if (blockPageTransition) {
            // 전환 차단 활성화 상태라면 경고창 표시
            alert('선택을 완료해야 이동할 수 있습니다.');
        } else {
            // 차단 조건이 없으면 정상적으로 페이지 이동
            window.location.href = navigateTo;
        }
    });
    
    // 브라우저 뒤로 가기 버튼 감지
    window.addEventListener("popstate", function (e) {
        if (blockPageTransition) {
            alert('뒤로 가기를 할 수 없습니다. 선택을 완료해주세요.');
            window.history.pushState(null, null, window.location.href); // 현재 상태 유지
        }else {
        	// URL 변경
            window.history.replaceState(null, null, '/');

            // 페이지 리로드
            window.location.reload();
        }
    });

 	// 미보유 버튼 클릭 이벤트
    notOwnedBtn.addEventListener('click', function () {
        fetch('/getSaveCarStatus', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.saveCar === 'Y') {
                // saveCar === 'Y'인 경우: 차량 삭제 모달 띄우기
                notOwnedBtn.classList.remove('btn-selected');
                confirmModal.show();
            } else if (data.notOwner === 'N') {
                // notOwner === 'N'인 경우: 상태를 '미보유'로 변경
                fetch('/memSaveCar', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({})
                })
                .then(response => response.text())
                .then(result => {
                    if (result === 'success') {
                        alert('미보유 상태로 변경되었습니다.');
                        notOwnedBtn.classList.add('btn-selected');

                        // 리다이렉트: 상태 변경 후 이동할 URL 지정
                        window.location.href = '/saveListView'; // 원하는 경로로 변경
                    } else {
                        alert('미보유 상태 변경에 실패했습니다.');
                    }
                })
                .catch(error => {
                    console.error('Error updating to not owned:', error);
                });
            }
        })
        .catch(error => {
            console.error('Error fetching saveCar status:', error);
        });
    });

    // 모달의 확인 버튼 클릭 이벤트
    confirmDeleteBtn.addEventListener('click', function () {
        fetch('/totalCarDel', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({})
        })
        .then(response => response.text())
        .then(result => {
            if (result === 'success') {
                alert('모든 차량이 삭제되었습니다.');
                location.reload(); // 페이지 새로고침
            } else {
                alert('차량 삭제에 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error deleting all cars:', error);
        });
    });

    // 리스트 로드 함수
    function loadCarList(fetchUrl, tableBody, carType, impUrl) {
        fetch(fetchUrl)
            .then(function (response) {
                if (!response.ok) {
                    throw new Error('데이터를 가져오는 중 오류가 발생했습니다.');
                }
                return response.json();
            })
            .then(function (carList) {
                tableBody.innerHTML = ''; // 테이블 초기화
                carList.forEach(function (car) {
                    const row = document.createElement('tr');
                    row.className = 'table-light';
                    row.innerHTML =
                        "<td>" +
                        "<svg xmlns='http://www.w3.org/2000/svg' fill='" + (car.important === '1' ? '#FFD700' : 'none') + "' viewBox='0 0 24 24' stroke-width='1.5' stroke='currentColor' class='size-6 like-icon'>" +
                        "<path stroke-linecap='round' stroke-linejoin='round' d='M11.48 3.499a.562.562 0 0 1 1.04 0l2.125 5.111a.563.563 0 0 0 .475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 0 0-.182.557l1.285 5.385a.562.562 0 0 1-.84.61l-4.725-2.885a.562.562 0 0 0-.586 0L6.982 20.54a.562.562 0 0 1-.84-.61l1.285-5.386a.562.562 0 0 0-.182-.557l-4.204-3.602a.562.562 0 0 1 .321-.988l5.518-.442a.563.563 0 0 0 .475-.345L11.48 3.5Z' />" +
                        "</svg>" +
                        "</td>" +
                        "<td>" + car.carName + "</td>" +
                        "<td>" + car.carBuyDate + "</td>" +
                        "<td><button class='btn btn-danger btn-sm delete-row'>X</button></td>";
                    tableBody.appendChild(row);

                    // 중요 상태 변경 이벤트 추가
                    const likeIcon = row.querySelector('.like-icon');
                    likeIcon.addEventListener('click', function () {
                        updateImportantStatus(impUrl, car.carName, carType, function () {
                            loadCarList(fetchUrl, tableBody, carType, impUrl); // 업데이트 후 리스트 다시 불러오기
                        });
                    });

                    // 삭제 버튼 이벤트 추가
                    row.querySelector('.delete-row').addEventListener('click', function () {
                        if (car.important === '1') {
                            alert('중요 항목은 삭제할 수 없습니다.');
                        } else {
                            deleteCar(fetchUrl.replace('SaveCarList', 'delCar'), car.carName, carType, row);
                        }
                    });
                });
            })
            .catch(function (error) {
                console.error(error);
            });
    }

    // 중요 상태 업데이트 함수
    function updateImportantStatus(url, carName, carType, callback) {
        $.ajax({
            type: 'POST',
            url: url,
            data: { carName: carName, carType: carType },
            success: function (response) {
                if (response === 'success') {
                    callback(); // 성공 시 콜백 호출
                } else {
                    alert('중요 상태 업데이트에 실패했습니다.');
                }
            },
            error: function () {
                alert('중요 상태 업데이트 요청 중 오류가 발생했습니다.');
            }
        });
    }

    // 삭제 함수
    function deleteCar(url, carName, carType, row) {
        $.ajax({
            type: 'POST',
            url: url,
            data: { carName: carName, carType: carType },
            success: function (response) {
                if (response === 'success') {
                    row.remove(); // 성공 시 테이블에서 해당 행 삭제
                } else {
                    alert('삭제에 실패했습니다.');
                }
            },
            error: function () {
                alert('삭제 요청 중 오류가 발생했습니다.');
            }
        });
    }
    
 	// 버튼 및 상태 업데이트 함수
    function updateButtonAndStatus(data) {
        if (data.notOwner === 'Y') {
            notOwnedBtn.classList.add('btn-selected');
        } else if (data.saveCar === 'Y') {
            notOwnedBtn.classList.remove('btn-selected');
        }
    }
 	
});
</script>

<body>
        <div class="cont overflow-y-auto">

			<!-- 헤더 영역 -->
			<jsp:include page="/WEB-INF/inc/headerNo.jsp"></jsp:include>
			<!-- 헤더 영역 -->
			
            <div class="maincss px-4 d-flex justify-content-end">
                <!-- 버튼 -->
                <button id="notOwnedBtn" class="btn btn-outline-primary responsive-text p-2 me-2" aria-disabled="true">
					미보유
				</button>
                <button class=" btn btn-outline-primary responsive-text p-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
                	+ 보유 차량 추가
                </button>
            </div>
			<!-- 테이블 컨테이너 -->
    		<div class="table-wrapper">
			    <!-- 전기차 테이블 -->
			    <div class="maincss p-2">
			        <div class="responsive-subtext p-2">나의 보유 전기차</div>
			        <table id="eCarTable" class="table table-sm responsive-tabletext" style="text-align: center;">
			            <colgroup>
			                <col class="col-md-1 col-lg-1 col-xl-1" />
			                <col class="col-md-5 col-lg-5 col-xl-6" />
			                <col class="col-md-2 col-lg-2 col-xl-2" />
			                <col class="col-md-1 col-lg-1 col-xl-1" />
			            </colgroup>
			            <thead>
			                <tr class="table-warning">
			                    <th></th>
			                    <th>차종</th>
			                    <th>구매일자</th>
			                    <th></th>
			                </tr>
			            </thead>
			            <tbody id="eCarTableBody">
			                <!-- 전기차 데이터가 동적으로 추가될 영역 -->
			            </tbody>
			        </table>
			    </div>
			
			    <!-- 내연기관 테이블 -->
			    <div class="maincss p-2">
			        <div class="responsive-subtext p-2">나의 보유 내연기관차</div>
			        <table id="gCarTable" class="table table-sm responsive-tabletext" style="text-align: center;">
			            <colgroup>
			                <col class="col-md-1 col-lg-1 col-xl-1" />
			                <col class="col-md-5 col-lg-5 col-xl-6" />
			                <col class="col-md-2 col-lg-2 col-xl-2" />
			                <col class="col-md-1 col-lg-1 col-xl-1" />
			            </colgroup>
			            <thead>
			                <tr class="table-warning">
			                    <th></th>
			                    <th>차종</th>
			                    <th>구매일자</th>
			                    <th></th>
			                </tr>
			            </thead>
			            <tbody id="gCarTableBody">
			                <!-- 내연기관차 데이터가 동적으로 추가될 영역 -->
			            </tbody>
			        </table>
			    </div>
			</div>
            
            <!-- 차량 삭제 모달 -->
			<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="confirmModalLabel">차량 삭제 확인</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        	정말 모든 차량을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			        <button type="button" class="btn btn-danger" id="confirmDeleteBtn">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
            
            <!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    <div class="modal-dialog modal-md">
			        <div class="modal-content p-4">
			            <form id="carForm" method="POST" action="/saveCar">
			                
			                <div class="modal-body d-flex align-items-center justify-content-end">
			                    <span class="re_sm_logo_modal me-auto" id="exampleModalLabel">보유 차량 추가</span>
			                    <button type="button" class="btn-close align-self-center" data-bs-dismiss="modal" aria-label="Close"></button>
			                </div>
			                <div class="modal-body">
							    <h2>차종</h2>
							
							    <!-- 차량 유형 버튼 -->
							    <button type="button" class="btn btn-outline-warning car-type-btn" data-type="haveecar">전기차</button>
							    <button type="button" class="btn btn-outline-warning car-type-btn" data-type="havegcar">내연기관차</button>
							
							    <div class="input-group mb-3 mt-2 position-relative">
							        <input type="text" class="form-control responsive-input" id="searchInput" name="carName" placeholder="직접 검색하여 차량을 선택해 보세요." disabled>
							        <!-- 검색 결과 드롭다운 -->
							        <ul id="resultList" class="list-group"></ul>
							    </div>
							
							    <!-- 오류 및 상태 메시지 -->
							    <div class="text-end mt-2">
							        <small id="emailError" class="text-danger d-block"></small>
							        <small id="emailCurr" class="text-success d-block"></small>
							    </div>
							
							    <hr>
							    <table class="table table-sm responsive-tabletext" style="text-align: center;">
							        <colgroup>
							            <col class="col-md-1 col-lg-1 col-xl-1" />
							            <col class="col-md-5 col-lg-5 col-xl-6" />
							            <col class="col-md-1 col-lg-1 col-xl-1" />
							        </colgroup>
							        <thead>
							            <tr class="table-warning">
							                <th></th>
							                <th>차량 모델명</th>
							                <th></th>
							            </tr>
							        </thead>
							        <tbody id="modalTableBody">
							            <!-- 데이터가 추가될 영역 -->
							        </tbody>
							    </table>
							
							    <h2>구매일자 등록</h2>
							    <input class="form-control log fs-3" id="carBuyDate" name="carBuyDate" type="date" />
							    <button class="btn btn-primary w-100 responsive-text" type="submit">추가</button>
							</div>
			            </form>
			        </div>
			    </div>
			</div>
        </div>
        
        <!-- 풋터 영역 -->
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		<!-- 풋터 영역 -->
            
</body>

</html>