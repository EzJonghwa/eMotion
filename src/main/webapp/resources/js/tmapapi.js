const TMAP_API_KEY = 'hK16EQ22PI8xceOsMCRZI6GSYMhAaI2s9pmKiS2M'; // T MAP API 키를 여기에 입력하세요.

// 자동완성 기능 구현
//debounce 함수 정의
function debounce(func, delay) {
  let timer;
  return function (...args) {
    clearTimeout(timer); // 이전 타이머를 제거
    timer = setTimeout(() => func.apply(this, args), delay); // 지연 후 실행
  };
}

class AutoComplete {
  constructor(inputId, resultId, delay = 500) {
    this.inputElement = document.getElementById(inputId);
    this.resultElement = document.getElementById(resultId);
    this.lat = null;
    this.lon = null;
    this.region = ''; // 지역 저장 변수

    this.handleInput = debounce(this.handleInput.bind(this), delay);
    this.displayResults = this.displayResults.bind(this);
    this.handleSelection = this.handleSelection.bind(this);

    this.inputElement.addEventListener("input", this.handleInput);
    this.resultElement.addEventListener("click", this.handleSelection);
  }

  async handleInput() {
    const query = this.inputElement.value.trim();
    if (!query) {
      this.resultElement.innerHTML = "";
      return;
    }

    try {
      const response = await fetch(
        `https://apis.openapi.sk.com/tmap/pois?version=1&searchKeyword=${encodeURIComponent(query)}&resCoordType=WGS84GEO&reqCoordType=WGS84GEO&count=10`,
        { headers: { "appKey": TMAP_API_KEY } }
      );
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      this.displayResults(data.searchPoiInfo.pois.poi || []);
    } catch (error) {
      console.error("자동완성 요청 실패:", error);
      this.resultElement.innerHTML = "<div>검색 결과를 가져올 수 없습니다.</div>";
    }
  }

  displayResults(results) {
    this.resultElement.innerHTML = results
      .map(
        (poi) => `
        <div class="autocomplete-item" data-lat="${poi.frontLat}" data-lon="${poi.frontLon}" data-region="${poi.upperAddrName}">
          ${poi.name} (${poi.upperAddrName} ${poi.middleAddrName})
        </div>`
      )
      .join("");
  }

  handleSelection(event) {
    const item = event.target.closest(".autocomplete-item");
    if (item) {
      this.lat = parseFloat(item.getAttribute("data-lat"));
      this.lon = parseFloat(item.getAttribute("data-lon"));
      this.region = item.getAttribute("data-region");
      this.inputElement.value = item.textContent.trim();
      this.resultElement.innerHTML = "";

      console.log('Selected region:', this.region);
      const regionElement = document.getElementById(`${this.inputElement.id}-region`);
      if (regionElement) {
        regionElement.textContent = `${this.region}`;
      }
      const hiddenRegionInput = document.getElementById(`${this.inputElement.id}-region-hidden`);
      if (hiddenRegionInput) {
        hiddenRegionInput.value = `${this.region}`;
      }
    }
  }

  getCoordinates() {
    return { lat: this.lat, lon: this.lon };
  }
}

// 거리 계산 함수
function calculateDistance(lat1, lon1, lat2, lon2) {
  const R = 6371; // 지구 반지름 (km)
  const dLat = degToRad(lat2 - lat1);
  const dLon = degToRad(lon2 - lon1);
  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(degToRad(lat1)) * Math.cos(degToRad(lat2)) *
    Math.sin(dLon / 2) * Math.sin(dLon / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  return R * c; // 거리 반환 (km)
}

// 도(degree) -> 라디안(radian) 변환 함수
function degToRad(deg) {
  return deg * (Math.PI / 180);
}

// 초기화
document.addEventListener("DOMContentLoaded", () => {
  const startAutoComplete = new AutoComplete("start", "start-results");
  const endAutoComplete = new AutoComplete("end", "end-results");

  document.getElementById("calculate-distance").addEventListener("click", () => {
    const startCoords = startAutoComplete.getCoordinates();
    const endCoords = endAutoComplete.getCoordinates();

    if (!startCoords.lat || !endCoords.lat) {
      alert("출발지와 도착지를 올바르게 입력하세요.");
      return;
    }

    const distance = calculateDistance(
      startCoords.lat,
      startCoords.lon,
      endCoords.lat,
      endCoords.lon
    )
    totaldis.value = distance.toFixed(2).trim();
  });
});