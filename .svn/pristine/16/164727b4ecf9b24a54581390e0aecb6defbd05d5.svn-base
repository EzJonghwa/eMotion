package com.eMotion.team.push.vo;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import nl.martijndwars.webpush.Subscription;

@Component
public class SubscriptionRepo {

	   private Map<String, Subscription> subscriptionMap = new HashMap<>();
	    // 구독 추가
	    public void addSub(String userId, Subscription sub) {
	        subscriptionMap.put(userId, sub);
	    }
	    // 구독 조회
	    public Subscription getSubByUserId(String userId) {
	    	System.out.println(subscriptionMap);
	        return subscriptionMap.get(userId);
	    }
	    // 모든 구독 조회
	    public Map<String, Subscription> getAllSubscriptions() {
	        return subscriptionMap;
	    }
	    // 구독 제거
	    public void removeSub(String userId) {
	        subscriptionMap.remove(userId);
	    }
		
		
}
