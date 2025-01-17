		// 포로그레스 바 스클립트
  function createProgressBar(containerId, LMax, RMax, leftValue, rightValue, text) {

  var progressMain = document.getElementById(containerId);
  
  progressMain.innerHTML += '<div class="d-flex justify-content-center">' +
                            '<h5 class="headfont center">'+ text +'</h5>' +
                            '</div>' +
                            '<div class="row">' +
                            '<div class="col">' +
                            '<div class="progress-container justify-content-end" id="left-container'+containerId+'">' +
                            '</div>' +
                            '</div>' +
                            '<div class="col">' +
                            '<div class="progress-container justify-content-start" id="right-container'+containerId+'">' +
                            '</div>' +
                            '</div>' +
                            '</div>';

  var leftContainer = document.getElementById("left-container" + containerId);
  var rightContainer = document.getElementById("right-container" + containerId);

  // 좌측, 우측 프로그래스 바 추가
  leftContainer.innerHTML += '<div class="progress-bar left-progress" id="left-progress' + containerId + '" data-value="' + leftValue + '"></div><div class="tips" id="tips-left' + containerId + '"></div>';
  rightContainer.innerHTML += '<div class="progress-bar right-progress" id="right-progress' + containerId + '" data-value="' + rightValue + '"></div><div class="tips" id="tips-right' + containerId + '"></div>';

  // 새로 추가된 요소 가져오기
  var leftProgressBar = document.getElementById("left-progress" + containerId);
  var rightProgressBar = document.getElementById("right-progress" + containerId);

  // 프로그래스 바의 너비 설정
  leftProgressBar.style.width = (leftValue / LMax) * 100 + "%";
  rightProgressBar.style.width = (rightValue / RMax) * 100 + "%";

  var tipsLeft = document.getElementById("tips-left" + containerId);
  var tipsRight = document.getElementById("tips-right" + containerId);

  // 툴팁 표시 함수
  function showTooltip(event, tips, value, isReversed = false) {
    var containerRect = event.target.parentElement.getBoundingClientRect();
    tips.style.display = "block";
    tips.textContent = value;

    // 위치 계산
    var tooltipX = isReversed
      ? containerRect.right - event.clientX // 오른쪽부터 채워지는 경우
      : event.clientX - containerRect.left;

    tips.style.left = tooltipX + "px";
    tips.style.top = "-40px";
  }

  // 툴팁 숨기기 함수
  function hideTooltip(tips) {
    tips.style.display = "none";
  }

  // 좌측 프로그래스 바 이벤트
  leftProgressBar.addEventListener("mousemove", function (event) {
    showTooltip(event, tipsLeft, leftProgressBar.getAttribute("data-value"));
  });

  leftProgressBar.addEventListener("mouseleave", function () {
    hideTooltip(tipsLeft);
  });

  // 우측 프로그래스 바 이벤트
  rightProgressBar.addEventListener("mousemove", function (event) {
    showTooltip(event, tipsRight, rightProgressBar.getAttribute("data-value"));
  });

  rightProgressBar.addEventListener("mouseleave", function () {
    hideTooltip(tipsRight);
  });
}