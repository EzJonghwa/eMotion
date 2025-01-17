const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))

//가격 정렬 버튼
const orderPriceButtonStates = [
    { text: "가격", class: "btn btn-secondary", icon: null, action: "default"},
    { text: "가격", class: "btn btn-primary", action: "ASC",
      icon: `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
				<line x1="12" y1="19" x2="12" y2="5"></line>
				<polyline points="6 11 12 5 18 11"></polyline>
			 </svg>`
	},
    { text: "가격", class: "btn btn-primary", action: "DESC",
	  icon: `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
				  <line x1="12" y1="5" x2="12" y2="19"></line>
				  <polyline points="6 13 12 19 18 13"></polyline>
			 </svg>`
    }
];

//주행거리 정렬 버튼
const orderSingleButtonStates = [
    { text: "1회충전주행거리", class: "btn btn-secondary", icon: null, action: "default"},
    { text: "1회충전주행거리", class: "btn btn-primary", action: "ASC",
        icon: `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
					<line x1="12" y1="19" x2="12" y2="5"></line>
					<polyline points="6 11 12 5 18 11"></polyline>
				</svg>`
    },
    { text: "1회충전주행거리", class: "btn btn-primary", action: "DESC",
	  icon: `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
				  <line x1="12" y1="5" x2="12" y2="19"></line>
				  <polyline points="6 13 12 19 18 13"></polyline>
			 </svg>`
    }
];

let orderPriceIndex = 0;
let orderSingleIndex = 0;

$(document).ready(function(){

    // Hidden fields
    const singleOrderValue = document.getElementById("singleOrder").value;
    const priceOrderValue = document.getElementById("priceOrder").value;
    // Buttons
    const orderPriceButton = document.getElementById("order-price");
    const orderSingleButton = document.getElementById("order-single");
    
    
    console.log($("#priceIdx").val(), 'pp')
    console.log($("#singleIdx").val(), 'ss')
    orderPriceIndex = $("#priceIdx").val();
    orderSingleIndex = $("#singleIdx").val();
    let currentPriceState = orderPriceButtonStates[orderPriceIndex];
    let currentSingleState = orderSingleButtonStates[orderSingleIndex];
    
    
    // Initialize `order-price` button
    const priceOrderIndex = orderPriceButtonStates.findIndex(
        (state) => state.action === priceOrderValue
    );
    if (priceOrderIndex !== -1) {
        const currentPriceState = orderPriceButtonStates[priceOrderIndex];
        orderPriceButton.innerText = currentPriceState.text;
        orderPriceButton.className = currentPriceState.class;
        orderPriceButton.innerHTML = currentPriceState.icon 
        ? `${currentPriceState.text}${currentPriceState.icon}` // 아이콘이 있는 경우
        : currentPriceState.text; // 아이콘이 없는 경우
        
        
        orderPriceButton.setAttribute("data-action", currentPriceState.action);
    }

    // Initialize `order-single` button
    const singleOrderIndex = orderSingleButtonStates.findIndex(
        (state) => state.action === singleOrderValue
    );
    if (singleOrderIndex !== -1) {
        const currentSingleState = orderSingleButtonStates[singleOrderIndex];
        orderSingleButton.innerText = currentSingleState.text;
        orderSingleButton.className = currentSingleState.class;
        
        orderSingleButton.innerHTML = currentSingleState.icon 
        ? `${currentSingleState.text}${currentSingleState.icon}` // 아이콘이 있는 경우
        : currentSingleState.text; // 아이콘이 없는 경우
        
        
        orderSingleButton.setAttribute("data-action", currentSingleState.action);
    }
    
  
    
    document.getElementById("buttonContainer").addEventListener("click", function (event) {
        // 가격 정렬 버튼 바꾸기
    	if (event.target.id === "order-price") {
        	
    		orderPriceIndex = (orderPriceIndex + 1) % orderPriceButtonStates.length;
    		currentPriceState = orderPriceButtonStates[orderPriceIndex];
            console.log(currentPriceState);
            event.target.innerText = currentPriceState.text;
            event.target.className = currentPriceState.class;
            event.target.innerHTML = currentPriceState.icon 
	            ? `${currentPriceState.text}${currentPriceState.icon}` // 아이콘이 있는 경우
	            : currentPriceState.text; // 아이콘이 없는 경우
            event.target.setAttribute("data-action", currentPriceState.action);
            $("#priceIdx").val(orderPriceIndex);
            
        } else if (event.target.id === "order-single"){
        	
        	orderSingleIndex = (orderSingleIndex + 1) % orderSingleButtonStates.length;
        	currentSingleState = orderSingleButtonStates[orderSingleIndex];
            
            event.target.innerText = currentSingleState.text;
            event.target.className = currentSingleState.class;
            event.target.innerHTML = currentSingleState.icon 
	            ? `${currentSingleState.text}${currentSingleState.icon}` // 아이콘이 있는 경우
	            : currentSingleState.text; // 아이콘이 없는 경우
            event.target.setAttribute("data-action", currentSingleState.action);
            $("#singleIdx").val(orderSingleIndex);
        }
    	sendOrderValue(currentPriceState.action, currentSingleState.action);
    });
   
    
    function sendOrderValue(priceOrder, singleOrder){
    	console.log(priceOrder, singleOrder);
    	$("#singleOrder").val(singleOrder);
    	$("#priceOrder").val(priceOrder);
    	$("#searchForm").submit();
    } 
    
    $(".card").each(function(){
        // 현재 카드의 imgurl 값 가져오기
        const imgUrl = $(this).find('input[name="imgUrl"]').val();
        // 이미지 경로 생성
        const encodedPath = imgUrl;
        const decodedPath = decodeURIComponent(encodedPath);
        // 현재 카드의 img 태그에 경로 설정
        $(this).find("img").attr("src", decodedPath);
        
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
    $(document).on("click", ".heart-icon-container", function(event) {
        event.stopPropagation(); // 모달 열림 방지
        const memberEmail = document.querySelector('.detail-email').textContent.trim();
        
        if (memberEmail === "") {
            alert("내 저장목록에 추가하려면 로그인해주세요!");
            return;
        }

        const clickedHeart = $(this).find('svg');
        const carName = clickedHeart.data("carname");
        const email = clickedHeart.data("email");
        const rownum = clickedHeart.attr("class").split(" ")[0].split("-")[2];
        
        // 모든 관련된 하트 아이콘 선택 (카드와 모달 모두)
        const relatedHearts = $(`.like-heart-${rownum}`);
        
        if (clickedHeart.hasClass("bi-heart")) {
            // 찜하기 추가
            relatedHearts.removeClass("bi-heart").addClass("bi-heart-fill")
                .html('<path fill="red" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>');
                
            $.ajax({
                url: '/getSelect/insertPreper',
                method: 'POST',
                data: { eCarName: carName, email: email },
                success: function(response) {
                    console.log("찜하기 추가 성공:", response);
                    alert("내 저장목록에 추가되었어요. 마이페이지에서 확인해보세요.");
                },
                error: function(xhr, status, error) {
                    console.error("찜하기 추가 실패:", status, error);
                }
            });
        } else if (clickedHeart.hasClass("bi-heart-fill")) {
            // 찜하기 취소
            relatedHearts.removeClass("bi-heart-fill").addClass("bi-heart")
                .html('<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>');
                
            $.ajax({
                url: '/getSelect/deletePreper',
                method: 'POST',
                data: { eCarName: carName, email: email },
                success: function(response) {
                    console.log("찜하기 취소 성공:", response);
                    alert("내 저장목록에서 삭제했어요.");
                },
                error: function(xhr, status, error) {
                    console.error("찜하기 취소 실패:", status, error);
                }
            });
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
            url: '/getSelect/otherLocal', // 서버에서 처리할 URL
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ selectedValue: selectedValue }), // 전송할 데이터
            success: function (response) {
                // 서버 응답 성공 처리
                //console.log("응답 성공:", response);

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
    	const memberEmail = document.querySelector('.detail-email').textContent.trim();
    	if(memberEmail != ""){
    		console.log("로그인 아이디: ", memberEmail);
    		
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
	            url: '/getSelect/otherLocal', // 서버에서 처리할 URL
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
    	} else if (memberEmail == ""){
    		console.log("로그인 아이디가 없습니다");
    		alert("로그인이 필요한 기능입니다!");
    	}
    });
    
    // 모달 이미지로 저장 기능
    $(document).ready(function () {
    	
        $("#listContainer").on("click", ".save-modal-btn", function () {
        	const memberEmail = document.querySelector('.detail-email').textContent.trim();
        	if(memberEmail != ""){
        		console.log("로그인 아이디: ", memberEmail);
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
        	} else if (memberEmail == ""){
        		console.log("로그인 아이디가 없습니다");
        		alert("로그인이 필요한 기능입니다!");
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
    
    
    });