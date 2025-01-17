document.addEventListener('DOMContentLoaded', () => {
    const companyInput = document.getElementById('memCorp'); // 입력 필드
    const autocompleteList = document.getElementById('autocomplete-list'); // 자동완성 리스트
    const companyList = JSON.parse(document.getElementById('company-data').value); // JSON 데이터

    const maxResults = 10; // 최대 표시할 검색 결과 개수
    let selectedCompany = ''; // 현재 선택된 회사 이름

    // 입력 이벤트 처리
    companyInput.addEventListener('input', (e) => {
        const value = e.target.value.toLowerCase();
        autocompleteList.innerHTML = ''; // 기존 리스트 초기화
        selectedCompany = ''; // 입력 중에는 선택된 값을 초기화

        if (value) {
            const filteredCompanies = companyList.filter(company =>
                company.corpName.toLowerCase().includes(value)
            );

            // 최대 10개까지 표시 + 추가 갯수
            const resultsToShow = filteredCompanies.slice(0, maxResults);
            resultsToShow.forEach(company => {
                const li = document.createElement('li');
                li.textContent = company.corpName;
                li.addEventListener('mousedown', () => { // mousedown 사용으로 blur 문제 방지
                    companyInput.value = company.corpName; // 선택된 값 설정
                    selectedCompany = company.corpName; // 선택된 값 저장
                    autocompleteList.innerHTML = ''; // 리스트 닫기
                });
                autocompleteList.appendChild(li);
            });

            // 추가 갯수 표시
            if (filteredCompanies.length > maxResults) {
                const extraCount = filteredCompanies.length - maxResults;
                const li = document.createElement('li');
                li.textContent = `+ ${extraCount} more`;
                li.classList.add('disabled');
                autocompleteList.appendChild(li);
            }
        }
    });

    // 포커스 아웃 시 처리
    companyInput.addEventListener('blur', () => {
        setTimeout(() => { // mousedown 이벤트와의 충돌 방지
            const value = companyInput.value;
            const isValid = companyList.some(company => company.corpName === value);

            if (!isValid) {
                companyInput.value = ''; // 입력 값이 유효하지 않으면 초기화
                selectedCompany = ''; // 선택된 값도 초기화
            } else {
                selectedCompany = value; // 입력 값이 유효하면 저장
            }

            autocompleteList.innerHTML = ''; // 리스트 닫기
        }, 150); // 클릭 이벤트와 blur 충돌 방지를 위해 딜레이 추가
    });

    // 폼 제출 시 유효성 검사
    const form = document.querySelector('form');
    form.addEventListener('submit', (e) => {
        const value = companyInput.value;
        const isValid = companyList.some(company => company.corpName === value);

        if (!isValid) {
            e.preventDefault(); // 폼 제출 중단
            alert('유효한 회사를 선택하세요.');
        }
    });
});
