var brandTag = new Set(); 
var selectedBrands = [];
var selectedCates = [];
var selectedMinCarPrice = '';
var selectedMaxCarPrice = '';
var selectedSubYN = ['Y', 'N'];

$(document).ready(function(){
    const tableBody = document.getElementById('carBrandTable'); // 테이블
    const searchInput = document.getElementById('searchBrand');

    // 검색 이벤트 처리
    searchInput.addEventListener('keyup', function () {
        const keyword = this.value.trim();
        loadAndUpdateCarBrands(keyword);
    });

    // 차종 선택 처리
    $('.category-item').on('click', function(e) {
        const checkbox = $(this).find('input[type="checkbox"]');
        const currentChecked = checkbox.prop('checked');
        
        // 체크박스 상태 변경
        checkbox.prop('checked', !currentChecked);
        
        // UI 상태 변경
        $(this).toggleClass('selected', !currentChecked);
        
        // 선택된 카테고리 업데이트
        selectedCates = $('input[name="selectedCates"]:checked').map(function(){
            return $(this).val();
        }).get();
        
        // AJAX 요청
        sendAjaxRequest(selectedCates, Array.from(brandTag), 
                       selectedMinCarPrice, selectedMaxCarPrice, selectedSubYN);
    });

    // 브랜드 체크박스 이벤트
    $(document).on('change', 'input[name="selectedBrands"]', function() {
        const brandName = $(this).val();
        const isChecked = $(this).prop('checked');
        
        if (isChecked) {
            brandTag.add(brandName);
        } else {
            brandTag.delete(brandName);
        }
        
        updateBrandTagDisplay();
        sendAjaxRequest(selectedCates, Array.from(brandTag), 
                       selectedMinCarPrice, selectedMaxCarPrice, selectedSubYN);
    });

    function sendAjaxRequest(selectedCates, selectedBrands,
                             selectedMinCarPrice, selectedMaxCarPrice, selectedSubYN) {        
         $.ajax({
                url: '/filter/updateSelected',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    selectedCates: selectedCates,
                    selectedBrands: Array.from(brandTag),
                    selectedMinCarPrice: Number(selectedMinCarPrice),
                    selectedMaxCarPrice: Number(selectedMaxCarPrice),
                    selectedSubYN: selectedSubYN
                }),
                success: function (response) {
                    console.log('항목 제거 및 업데이트 성공:', response);
                    $("#nowCnt").text("검색 "+response.nowCount+" 건")
                },
                error: function (error) {
                    console.error('항목 제거 및 업데이트 실패:', error);
                }
            });
    }

    function updateBrandTagDisplay() {
        const tagContainer = document.getElementById('tagContainer');
        tagContainer.innerHTML = '';
        
        brandTag.forEach(item => {
            const tag = document.createElement('div');
            tag.className = 'brand-tag';
            
            const brandText = document.createElement('span');
            brandText.textContent = item;
            tag.appendChild(brandText);
            
            const removeBtn = document.createElement('button');
            removeBtn.type = 'button';
            removeBtn.className = 'remove-brand';
            removeBtn.innerHTML = 'x';
            removeBtn.onclick = () => {
                brandTag.delete(item);
                // 체크박스 상태도 업데이트
                const checkbox = document.querySelector(`input[name="selectedBrands"][value="${item}"]`);
                if (checkbox) {
                    checkbox.checked = false;
                }
                updateBrandTagDisplay();
                sendAjaxRequest(selectedCates, Array.from(brandTag), 
                              selectedMinCarPrice, selectedMaxCarPrice, selectedSubYN);
            };
            
            tag.appendChild(removeBtn);
            tagContainer.appendChild(tag);
        });
    }

    function loadAndUpdateCarBrands(keyword = '') {
        const url = keyword === ''
            ? `${window.location.origin}/filter/updateSelected`  // 브랜드 목록을 가져오는 엔드포인트
            : `${window.location.origin}/filter/updateSelected?keyword=${encodeURIComponent(keyword)}`;

        fetch(url)
            .then(response => {
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                return response.json();
            })
            .then(data => {
                tableBody.innerHTML = '';
                if (data.length > 0) {
                    data.forEach(item => {
                        const isChecked = brandTag.has(item.carBrand);
                        const row = `
                            <tr class="brand-row">
                                <td class="d-flex align-items-center py-2">
                                    <div class="form-check">
                                        <input type="checkbox" 
                                               class="form-check-input" 
                                               id="${item.carBrand}" 
                                               name="selectedBrands" 
                                               value="${item.carBrand}"
                                               ${isChecked ? 'checked' : ''}>
                                        <label class="form-check-label d-flex align-items-center gap-3" 
                                               for="${item.carBrand}">
                                            <img src="/resources/assets/img/brandIcon/${item.brandImgUrl}"
                                                 onerror="this.onerror=null; this.src='/resources/assets/img/brandIcon/basic.png';"
                                                 alt="brand" width="40">
                                            <span class="brand-name">${item.carBrand}</span>
                                        </label>
                                    </div>
                                </td>
                            </tr>`;
                        tableBody.insertAdjacentHTML('beforeend', row);
                    });
                } else {
                    tableBody.innerHTML = '<tr><td colspan="2">검색 결과가 없습니다.</td></tr>';
                }
                
            })
            .catch(error => console.error('Error fetching data:', error));
    }

    // 전체 선택/해제 기능
    const checkAll = document.getElementById('checkAll');
    checkAll.addEventListener('change', function () {
        const isChecked = this.checked;
        const checkboxes = document.querySelectorAll('input[name="selectedBrands"]');
        checkboxes.forEach(checkbox => {
            checkbox.checked = isChecked;
            const brand = checkbox.value;
            if (isChecked) {
                brandTag.add(brand);
            } else {
                brandTag.delete(brand);
            }
        });
        updateBrandTagDisplay();
        sendAjaxRequest(selectedCates, Array.from(brandTag), 
                        selectedMinCarPrice, selectedMaxCarPrice, selectedSubYN);
    });

	


	//예산 슬라이드 실시간 값 화면에 반영
	const slideMin = document.getElementById('slideMin');
	const slideMax = document.getElementById('slideMax');
	const slideContainerInner = document.getElementById('slideContainerInner');
	const minValueDisplay = document.getElementById('minValueDisplay');
	const maxValueDisplay = document.getElementById('maxValueDisplay');
	const priceGap = 500;

	function updateSliderValues(event) {
		const minValue = parseInt(slideMin.value);
		const maxValue = parseInt(slideMax.value);
	
	    if (maxValue - minValue < priceGap) {
	        if (event.target === slideMin) {
	            slideMin.value = maxValue - priceGap;
	        } else {
	            slideMax.value = minValue + priceGap;
	        }
	    }
	
	    const rangeMinPercent = ((slideMin.value - slideMin.min) / (slideMin.max - slideMin.min)) * 100;
	    const rangeMaxPercent = 100 - ((slideMax.value - slideMax.min) / (slideMax.max - slideMax.min)) * 100;
	
	    slideContainerInner.style.left = `${rangeMinPercent}%`;
	    slideContainerInner.style.right = `${rangeMaxPercent}%`;
	
	    
	    minValueDisplay.textContent = slideMin.value;
	    maxValueDisplay.textContent = slideMax.value;
	    
	    selectedMinCarPrice = slideMin.value;
	    selectedMaxCarPrice = slideMax.value;
	    
	    sendAjaxRequest(selectedCates, Array.from(brandTag), 
				selectedMinCarPrice, selectedMaxCarPrice, selectedSubYN);
	}
	slideMin.addEventListener('input', updateSliderValues);
	slideMax.addEventListener('input', updateSliderValues);
	

	
	updateSliderValues({ target: slideMin });
	
	
	// 무관 버튼 클릭 이벤트
    $("#subAll").click(function () {
        // 무관 선택 시, 지원 체크 해제
    	selectedSubYN = [];
        selectedSubYN.push('Y');
        selectedSubYN.push('N');
        
        $("#subYes").prop("checked", false);
        $("#subAll").prop("checked", true);

        // Ajax 전송 데이터 설정
	    sendAjaxRequest(selectedCates, Array.from(brandTag), 
				selectedMinCarPrice, selectedMaxCarPrice, selectedSubYN);
    });

    // 지원 버튼 클릭 이벤트
    $("#subYes").click(function () {
        // 지원 선택 시, 무관 체크 해제
    	selectedSubYN = [];
        $("#subAll").prop("checked", false);
        $("#subYes").prop("checked", true);

        // Ajax 전송 데이터 설정
        selectedSubYN.push('Y');
	    sendAjaxRequest(selectedCates, Array.from(brandTag), 
				selectedMinCarPrice, selectedMaxCarPrice, selectedSubYN);
    });
    
	// 페이지 로드 시 전체 리스트 로드
    loadAndUpdateCarBrands();
    updateBrandTagDisplay();
	
});
	