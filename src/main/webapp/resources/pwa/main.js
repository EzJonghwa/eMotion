document.addEventListener("DOMContentLoaded", function () {
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker.register('/service-worker.js', { scope: '/' })
                .then(registration => {
                    console.log('Service Worker registered with scope:', registration.scope);

                    // 푸시 알림 구독 버튼 이벤트 설정
                    document.getElementById("subscribeBtn").addEventListener("click", async () => {
                        try {
                            var key = document.getElementById("key").value;
                            var userId = document.getElementById("userId").value;
                            const applicationServerKey = urlBase64ToUint8Array(key);
                            console.log(applicationServerKey);
                            const options = { userVisibleOnly: true, applicationServerKey};

                            const subscription = await registration.pushManager.subscribe(options);
                            
                            const payload = {
                            		
                            		userId: userId,
                            	    subscription: subscription
                            	};
                            await fetch('/api/subscribe', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json'
                                },
                                body: JSON.stringify(payload)
                            });

                            alert("푸시 알림 구독 완료");
                        } catch (error) {
                            console.error("Failed to subscribe:", error);
                            alert("푸시 알림 구독에 실패했습니다.");
                            alert(error);
                        }
                    });
                })
                .catch(error => {
                    console.error('Service Worker registration failed:', error);
                });
        }
    });

    function urlBase64ToUint8Array(base64String) {
        console.log('base64', base64String);
        const padding = '='.repeat((4 - base64String.length % 4) % 4);
        const base64 = (base64String + padding).replace(/-/g, '+').replace(/_/g, '/');
        const rawData = window.atob(base64);
        return new Uint8Array([...rawData].map(char => char.charCodeAt(0)));
    }

    function unsubscribe() {
        const endpoint = document.getElementById("endpoint").value;

        fetch('/api/unsubscribe', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ endpoint: endpoint })
        })
        .then(response => response.text())
        .then(data => {
            alert(data);
        })
        .catch(error => {
            console.error('Error:', error);
            alert('구독 취소에 실패했습니다.');
        });
    }