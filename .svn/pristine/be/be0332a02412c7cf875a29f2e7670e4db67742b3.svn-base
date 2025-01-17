self.addEventListener('push', function(event) {
    try {
        var data = event.data.json(); // 서버에서 전달된 JSON 데이터
        console.log('푸시 알림 수신:', data);
        var options = {};
        if(data.senderEmail==''){
        	options = {
        			body: data.body || '새 메시지가 도착했습니다.', // 알림 본문 (기본값 설정)
        			icon: data.icon || '/icon-96x96.png', // 알림 아이콘 (기본값 설정)
        			badge: data.badge || '/icon-72x72.svg' // 알림 배지 (기본값 설정)
        	};
        }else{
        	
        	options = {
        			body: data.body || '새 메시지가 도착했습니다.', // 알림 본문 (기본값 설정)
        			icon: data.icon || '/icon-96x96.png', // 알림 아이콘 (기본값 설정)
        			badge: data.badge || '/icon-72x72.svg', // 알림 배지 (기본값 설정)
        			data: {
        				receiverEmail: data.receiverEmail,
        			}
        	};
        }
        // 알림 표시
        event.waitUntil(
            self.registration.showNotification(data.title || '새 알림', options)
        );
    } catch (error) {
        console.error('푸시 알림 처리 중 오류 발생:', error);
    }
});

self.addEventListener('notificationclick', function(event) {
    event.notification.close(); // 알림 닫기

    try {
        var notificationData = event.notification.data;
        var receiverEmail = notificationData.receiverEmail;
        // 기본 URL을 가져오기
        var baseUrl = self.location.origin;
        if(receiverEmail == ''){
        	// 새로운 창 열기
        	event.waitUntil(
        			clients.openWindow(baseUrl)
        	);
        }else{
        	// 이동할 URL 생성 (백틱 대신 문자열 연결 사용)
        	var targetUrl = baseUrl + '/messagesViewDo?receiverEmail=' + receiverEmail;
        	console.log('알림 클릭으로 이동할 URL:', targetUrl);
        	// 새로운 창 열기
        	event.waitUntil(
        			clients.openWindow(targetUrl)
        	);
        }
    } catch (error) {
        console.error('알림 클릭 처리 중 오류 발생:', error);
    }
});
