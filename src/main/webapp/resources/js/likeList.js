const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))


$(document).ready(function(){
	
    $(".card").each(function(){
        
        //찜목록 확인해 리스트에 반영
        const carName = $(this).find('svg').data('carname');
	    const email = $(this).find('svg').data('email');
	//    console.log(carName);
	//    console.log(email);
		$.ajax({
	        url: '/getSelect', // 서버에서 처리할 URL
	        method: 'GET',
	        data : {eCarName:carName, email:email}, 
	        success: function (response) {
	            if (response && response.length > 0) {
	                response.forEach(function (item) {
	
	                    const targetHeart = $(`svg[data-carname="${item.ecarName}"]`);
	                    
	                    if (targetHeart.length > 0) {
	                        // 해당 차량의 하트를 채워진 하트로 변경
	                        targetHeart.removeClass("bi-heart").addClass("bi-heart-fill");
	                        targetHeart.html(`
	        	                    <path d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
	    	                `).attr("fill", "red");
	                    }else {
	                        console.log(`하트를 찾을 수 없습니다: ${item.ecarName}`);
	                    }
	                });
	            }                    
	        },
	        error: function (xhr, status, error) {
	            console.error("응답 실패:", status, error);
	        }
	    });
    });   
    
    //찜 저장 하트 아이콘 관련 이벤트
    // 하트 클릭 이벤트 처리
    $("#listContainer").on("click", "[class^='like-heart-']", function () {

	    	// 클릭된 하트를 가져옵니다.
	        const clickedHeart = $(this);
	
	        // 클래스에서 rownum 추출
	        const classList = clickedHeart.attr("class").split(" ");
	        let rownum = null;
	        classList.forEach(cls => {
	            if (cls.startsWith("like-heart-")) {
	                rownum = cls.split("-")[2]; // rownum 추출
	            }
	        });
	
	        if (!rownum) return; // rownum이 없으면 처리 중단
	
	        // 관련된 모든 하트를 선택 (카드와 모달에서 동일 rownum 사용)
	        const relatedHearts = $(`.like-heart-${rownum}`);
	        
	        // 현재 상태를 확인하여 변경
	        if (clickedHeart.hasClass("bi-heart")) {
	        	
	        	const clickedHeart = $(event.target);
	            const carName = clickedHeart.data("carname");
	            const email = clickedHeart.data("email");

	            // 빈 하트를 채워진 하트로 변경
	            relatedHearts.removeClass("bi-heart").addClass("bi-heart-fill");
	            relatedHearts.html(`
	                    <path d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
	                `).attr("fill", "red");
	            $.ajax({
	    	        url: '/getSelect/insertPreper', // 서버에서 처리할 URL
	    	        method: 'POST',
//	    	        contentType: 'application/json',
//	    	        data: JSON.stringify({ eCarName : carName,
//	    	        					   email : email}), // 전송할 데이터
	    	        data : {eCarName:carName, email:email}, 
	    	        success: function (response) {
	    	        	
	    	            console.log("응답 성공:", response);
	    	        },
	    	        error: function (xhr, status, error) {
	    	
	    	            console.error("응답 실패:", status, error);
	    	        }
	    	    });
	            alert("내 저장목록에 추가되었어요. 마이페이지에서 확인해보세요.")
	            
	        } else if (clickedHeart.hasClass("bi-heart-fill")){
	        	
	            const carName = clickedHeart.data("carname");
	            const email = clickedHeart.data("email");

	            // 채워진 하트를 빈 하트로 변경
	            relatedHearts.removeClass("bi-heart-fill").addClass("bi-heart");
	            relatedHearts.html(`
	                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
	            `).attr("fill", "currentColor");
	            
	            $.ajax({
	    	        url: '/getSelect/deletePreper', // 서버에서 처리할 URL
	    	        method: 'POST',
//	    	        contentType: 'application/json',
//	    	        data: JSON.stringify({ eCarName : carName,
//	    	        					   email : email}), // 전송할 데이터
	    	        data : {eCarName:carName, email:email}, 
	    	        success: function (response) {
	    	        	
	    	            console.log("응답 성공:", response);
	    	            location.reload();
	    	        },
	    	        error: function (xhr, status, error) {
	    	
	    	            console.error("응답 실패:", status, error);
	    	        }
	    	    });
	            alert("내 저장목록에서 삭제했어요.")
	        }
        
    
    });
    
	const searchedCarBody = document.getElementById('searchedCarBody'); // 테이블
	const searchInput = document.getElementById('searchCar');
	console.log(searchedCarBody);
	console.log(searchInput);

    // 검색 이벤트 처리
    searchInput.addEventListener('keyup', function () {
    	const keyword = this.value.trim();
	    console.log('Keyword:', keyword);
	    loadAndUpdateCar(keyword);
    });
	
	// 데이터 로드 및 테이블 업데이트 함수
	function loadAndUpdateCar(keyword = '') {
	    const url = keyword === ''
	        ? `${window.location.origin}/myLikeList/searchCar` // 전체 리스트 URL
	        : `${window.location.origin}/myLikeList/searchCar?keyword=${encodeURIComponent(keyword)}`;
	    console.log('Request URL:', url);

	    fetch(url)
	        .then(response => {
	            if (!response.ok) {
	                throw new Error(`HTTP error! status: ${response.status}`);
	            }
	            console.log(response);
	            return response.json();
	        })
	        .then(data => {
	        	console.log(data);
	        	searchedCarBody.innerHTML = '';
	            if (data.length > 0) {
	                data.forEach(car => {
	                    const row = `
	                        	<div class="card carbottom">
		                      
			                        <svg class="like-heart-${car.rownum } bi bi-heart" data-carname="${car.ecarName }"
									xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
									  	<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
									</svg>
								
			                        <div class="card img">
			                          <img src="/assets/img/elec_car_img/${car.imgUrl}" class="card-img-top" alt="...">
			                        </div>
		                        
			                        <div class="card-body">
			                          <p class="card-text">${car.ecarName }</p>
			                        </div>
			                        
		                      </div>`;
	                    searchedCarBody.insertAdjacentHTML('beforeend', row);
	                });
	                
	            } else {
	            	searchedCarBody.innerHTML = '<tr><td colspan="2">검색 결과가 없습니다.</td></tr>';
	            }
	        })
	        .catch(error => console.error('Error fetching data:', error));
	}
    
    //검색차량리스트에서 찜목록 추가 기능
    // 하트 클릭 이벤트 처리
    $("#searchedCarBody").on("click", "[class^='like-heart-']", function () {

	    	// 클릭된 하트를 가져옵니다.
	        const clickedHeart = $(this);
            const carName = clickedHeart.data("carname");
            
            const parentDiv = clickedHeart.closest("#searchedCarBody");
            const email = parentDiv.data("email");
            console.log("Email:", email);
	        // 현재 상태를 확인하여 변경
	        if (clickedHeart.hasClass("bi-heart")) {

	            // 빈 하트를 채워진 하트로 변경
	            clickedHeart.removeClass("bi-heart").addClass("bi-heart-fill");
	            clickedHeart.html(`
	                    <path d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
	                `).attr("fill", "red");
	            $.ajax({
	    	        url: '/getSelect/insertPreper', // 서버에서 처리할 URL
	    	        method: 'POST',
//	    	        contentType: 'application/json',
//	    	        data: JSON.stringify({ eCarName : carName,
//	    	        					   email : email}), // 전송할 데이터
	    	        data : {eCarName:carName, email:email}, 
	    	        success: function (response) {
	    	        	
	    	            console.log("응답 성공:", response);
	    	            location.reload();
	    	        },
	    	        error: function (xhr, status, error) {
	    	
	    	            console.error("응답 실패:", status, error);
	    	        }
	    	    });
	            alert("내 저장목록에 추가되었어요. 마이페이지에서 확인해보세요.")
	            
	        } else if (clickedHeart.hasClass("bi-heart-fill")){
	        	
	            const carName = clickedHeart.data("carname");
	            const email = clickedHeart.data("email");

	            // 채워진 하트를 빈 하트로 변경
	            relatedHearts.removeClass("bi-heart-fill").addClass("bi-heart");
	            relatedHearts.html(`
	                    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
	            `).attr("fill", "currentColor");
	            
	            $.ajax({
	    	        url: '/getSelect/deletePreper', // 서버에서 처리할 URL
	    	        method: 'POST',
//	    	        contentType: 'application/json',
//	    	        data: JSON.stringify({ eCarName : carName,
//	    	        					   email : email}), // 전송할 데이터
	    	        data : {eCarName:carName, email:email}, 
	    	        success: function (response) {
	    	        	
	    	            console.log("응답 성공:", response);
	    	            location.reload();
	    	        },
	    	        error: function (xhr, status, error) {
	    	
	    	            console.error("응답 실패:", status, error);
	    	        }
	    	    });
	            alert("내 저장목록에서 삭제했어요.")
	        }
    });
    
    $("#listContainer").on("click", ".btn-group:nth-child(1) .dropdown-item", function (event) {
        event.preventDefault(); // 기본 동작(링크 이동) 방지
        
        // 클릭된 항목의 텍스트 가져오기
        const selectedValue = $(this).text();

        // 현재 클릭된 모달의 ID 가져오기
        const localBox = $(this).closest("[id^='localBox']");
        const rownum = localBox.attr("id").split("-")[1];
        let resultContainer = $("#resultContainer-"+rownum);
        resultContainer.empty();
        resultContainer.append("다른 지역의 보조금과 지원금TO현황을 확인해보세요!");

        // 클릭된 항목과 관련된 버튼만 변경
        $(this).closest(".btn-group").find(".btn.dropdown-toggle").text(selectedValue);

        // 첫 번째 드롭다운 버튼 업데이트
        localBox.find(`#firstDropdownBtn-${rownum}`).text(selectedValue);
        
        // 두 번째 드롭다운 초기화
        localBox.find(`#secondDropdownBtn-${rownum}`).text("선택");

        
        // AJAX 요청
        $.ajax({
            url: '/myLikeList/otherLocal', // 서버에서 처리할 URL
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ selectedValue: selectedValue }), // 전송할 데이터
            success: function (response) {
                // 서버 응답 성공 처리
                console.log("응답 성공:", response);

                // 두 번째 드롭다운 갱신
            	const secondDropdown = localBox.find(`#secondDropdownBtn-${rownum}`).siblings(".dropdown-menu");
                updateSecondDropdown(secondDropdown, response.secondLocal);
            },
            error: function (xhr, status, error) {
                // 서버 응답 실패 처리
                console.error("응답 실패:", status, error);
            }
        });
    });

    $("#listContainer").on("click", ".btn-group:nth-child(2) .dropdown-item", function (event) {
        event.preventDefault(); // 기본 동작(링크 이동) 방지

        // 클릭된 항목의 텍스트 가져오기
        const selectedValue = $(this).text();

        // 두 번째 드롭다운 버튼의 텍스트 변경
        $(this).closest(".btn-group").find(".btn.dropdown-toggle").text(selectedValue);
    });
    
    // 조회 버튼 클릭 이벤트
    $("#listContainer").on("click", "[id^='eachLocalSearchBtn']", function () {
    
	        const localBox = $(this).closest("[id^='localBox']");
	        const rownum = localBox.attr("id").split("-")[1];
	
	        const firstSelectedValue = localBox.find(`#firstDropdownBtn-${rownum}`).text().trim();
	        const secondSelectedValue = localBox.find(`#secondDropdownBtn-${rownum}`).text().trim();
	        
	        const thirdSelectedValue = $("#exampleModalLabel").text().trim();
	        const forthSelectedValue = $("#kindOfCar").text().trim();
	        // 선택값이 없을 경우 경고
	        if (firstSelectedValue === "선택" || secondSelectedValue === "선택") {
	            alert("두 개의 드롭다운에서 모두 값을 선택해주세요.");
	            return;
	        }
	
	        // AJAX 요청으로 데이터 전송
	        $.ajax({
	            url: '/myLikeList/otherLocal', // 서버에서 처리할 URL
	            method: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify({
	                firstValue: firstSelectedValue,
	                secondValue: secondSelectedValue,
	                thirdValue: thirdSelectedValue,
	                forthValue: forthSelectedValue
	            }),
	            success: function (response) {
	                // 서버 응답 성공 처리
	            	//console.log("1번", response.selectedLocInfo);
	                //console.log("응답 성공:", response);
	            	let resultContainer = localBox.find(`#resultContainer-${rownum}`);
	                displayResults(resultContainer, response.selectedLocInfo);
	                
	            },
	            error: function (xhr, status, error) {
	                // 서버 응답 실패 처리
	                console.error("응답 실패:", status, error);
	                alert("데이터를 가져오는 데 실패했습니다.");
	            }
	        });
    	
    });
    
    
    $("#listContainer").on("hide.bs.modal", ".modal", function () {
        const localBox = $(this).find("[id^='localBox']");
        
        // 첫 번째 드롭다운 버튼 초기화
        localBox.find(".btn-group:nth-child(1) .btn.dropdown-toggle").text("지역선택");
        
        // 두 번째 드롭다운 버튼 초기화
        localBox.find(".btn-group:nth-child(2) .btn.dropdown-toggle").text("선택");
        
        // 결과 컨테이너 초기화
        localBox.find("[id^='resultContainer']").html("다른 지역의 보조금과 지원금 TO 현황을 확인해보세요!");
    });
    
    
    // 두 번째 드롭다운 갱신 함수
    function updateSecondDropdown(dropdownElement, items) {

    	dropdownElement.empty();
        // 새로운 항목 추가
        items.forEach(function (item) {
            const li = `<li><a class="dropdown-item" href="#">${item.addrDetail}</a></li>`;
            dropdownElement.append(li);
            console.log("드롭다운2리스트추가완료");
        });
    }
    
    // 조회 결과를 표시하는 함수
    function displayResults(obj,data) {
        obj.empty(); // 기존 내용 제거
        //console.log("2번",data);
        if (data[0]) {
        	const info = data[0];
        	//console.log(info.carCate);
            const resultHtml = `<p class="card-text">지방비보조금 | 잔여대수</p>
                				<p class="card-text">${info.locSubsidy}만원 | ${info.effLeftAll}/${info.effAllAll}대
                				<button id="other-TO-popover" class="TO-btn" data-bs-toggle="popover" data-bs-trigger="click" title="보조금 상세 TO (${info.selectedAddr })">
					               TO상세
					            </button>
				                </p>`
            obj.append(resultHtml);
            
            const popoverContent = (() => {
                if (info.carCate === '승용') {
                    return `
                        전체: ${info.effLeftAll}/${info.effAllAll}<br>
                        우선: ${info.effLeftFirst}/${info.effAllFirst}<br>
                        법인: ${info.effLeftCorporation}/${info.effAllCorporation}<br>
                        택시: ${info.effLeftTaxi}/${info.effAllTaxi}<br>
                        일반: ${info.effLeftCommon}/${info.effAllCommon}
                    `;
                } else if (info.carCate === '화물') {
                    return `
                        전체: ${info.effLeftAll}/${info.effAllAll}<br>
                        우선: ${info.effLeftFirst}/${info.effAllFirst}<br>
                        중소: ${info.effLeftSmallCompany}/${info.effAllSmallCompany}<br>
                        법인: ${info.effLeftCorporation}/${info.effAllCorporation}<br>
                        택배: ${info.effLeftDelivery}/${info.effAllDelivery}<br>
                        일반: ${info.effLeftCommon}/${info.effAllCommon}
                    `;
                } else if (info.carCate === '승합') {
                    return `
                        전체: ${info.effLeftAll}/${info.effAllAll}<br>
                        우선: ${info.effLeftFirst}/${info.effAllFirst}<br>
                        일반: ${info.effLeftCommon}/${info.effAllCommon}
                    `;
                } else if (info.carCate === '이륜차') {
                    return `
                        전체: ${info.effLeftAll}/${info.effAllAll}<br>
                        우선: ${info.effLeftFirst}/${info.effAllFirst}<br>
                        법인: ${info.effLeftCorporation}/${info.effAllCorporation}<br>
                        배달: ${info.effLeftDelivery}/${info.effAllDelivery}<br>
                        일반: ${info.effLeftCommon}/${info.effAllCommon}
                    `;
                } else {
                    return '정보가 없습니다.';
                }
            })();
            
            const newPopoverTriggerList = document.querySelector("#other-TO-popover");
            if (newPopoverTriggerList) {
                // 팝오버 초기화
                new bootstrap.Popover(newPopoverTriggerList, {
                    html: true,
                    content: popoverContent,
                    sanitize: false
                });
            }

        } else {
        	obj.html("<p>결과가 없습니다.</p>");
        }
    }
    // 모달 이미지로 저장 기능
    $(document).ready(function () {
    	
        $("#listContainer").on("click", ".save-modal-btn", function () {

	            const modalId = $(this).data("id");
	            const modal = document.querySelector(`#exampleModal-${modalId}`);
	
	            // 모달 복제
	            const clonedModal = modal.cloneNode(true);
	            clonedModal.style.position = "absolute";
	            clonedModal.style.top = "0";
	            clonedModal.style.left = "-9999px"; // 화면 밖으로 이동
	            clonedModal.style.width = "auto";
	            clonedModal.style.height = "auto";
	            clonedModal.style.visibility = "visible"; // 반드시 visible 설정
	            clonedModal.style.display = "block"; // block으로 설정
	            document.body.appendChild(clonedModal);
	
	            // 이미지 강제 로드
	            const images = clonedModal.querySelectorAll("img");
	            images.forEach(img => {
	                const src = img.src;
	                img.src = "";
	                img.src = src;
	            });
	
	            // html2canvas로 캡쳐
	            html2canvas(clonedModal, {
	                useCORS: true,
	                allowTaint: false,
	                scale: 2
	            }).then(canvas => {
	                // 캡쳐된 내용을 이미지로 저장
	                const imageData = canvas.toDataURL("image/png");
	                const link = document.createElement("a");
	                link.href = imageData;
	                link.download = `modal_${modalId}_capture.png`;
	                link.click();
	            }).catch(error => {
	                console.error("캡쳐 실패:", error);
	                alert("캡쳐 중 오류가 발생했습니다.");
	            }).finally(() => {
	                // 캡쳐 후 복제된 모달 제거
	                document.body.removeChild(clonedModal);
	            });
        
        	
        });
    });
    
    
    
    });