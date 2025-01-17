package com.eMotion.team.push.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.eMotion.team.push.service.PushNotificationService;
import com.eMotion.team.push.vo.SubscriptionRepo;
import com.eMotion.team.push.vo.SubscriptionVO;

import nl.martijndwars.webpush.Subscription;

@RestController
@RequestMapping("/api")
public class PwaRestController {

	@Autowired
	private PushNotificationService service;
	@Autowired
	private SubscriptionRepo repo;

	@PostMapping("/subscribe")
	 public ResponseEntity<Void> subscribe(@RequestBody Map<String, Object> payload) {
        try {
        	String email = (String) payload.get("userId");
        	Map<String, Object> subscriptionData = (Map<String, Object>) payload.get("subscription");
        	if (subscriptionData == null) {
    			throw new IllegalArgumentException("subscription 데이터가 누락되었습니다.");
    		}
        	// endpoint 추출
    		String endpoint = (String) subscriptionData.get("endpoint");
    		if (endpoint == null || endpoint.isEmpty()) {
    			throw new IllegalArgumentException("endpoint 데이터가 누락되었습니다.");
    		}

    		// keys 추출
    		@SuppressWarnings("unchecked")
    		Map<String, String> keysData = (Map<String, String>) subscriptionData.get("keys");
    		if (keysData == null) {
    			throw new IllegalArgumentException("keys 데이터가 누락되었습니다.");
    		}

    		String p256dh = keysData.get("p256dh");
    		String auth = keysData.get("auth");

    		if (p256dh == null || auth == null) {
    			throw new IllegalArgumentException("p256dh 또는 auth 데이터가 누락되었습니다.");
    		}
    		// Subscription 객체 생성
    		SubscriptionVO subVO = new SubscriptionVO(email, endpoint, p256dh, auth); 
    		service.insertSubscription(subVO);
    		
    		// Subscription.Keys 객체 생성
    		Subscription.Keys keys = new Subscription.Keys(p256dh, auth);
    		// Subscription 객체 생성
    		Subscription sub = new Subscription(endpoint, keys);
    		
    		service.sendPush(sub, "구독되었습니다.", "반갑습니다. 이제 채팅 내용이 알람으로 출력됩니다.");
    		
    		return new ResponseEntity<>(HttpStatus.CREATED);
    		
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 에러 발생 시 500 반환
        }
    }


}
