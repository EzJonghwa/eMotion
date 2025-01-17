package com.eMotion.team.push.vo;


import lombok.Data;

@Data
public class SubscriptionVO {
	
	private int notiId;                // 기본 키
    private String email;          // 사용자 ID
    private String endpoint;       // 푸시 알림 엔드포인트
    private String p256dhKey;      // 클라이언트 공개키
    private String authKey;        // 클라이언트 인증 키
    private String createDt;         // 생성일
    private String chatSeller;         // 생성일
    private String chatProdId;
    
	public SubscriptionVO(String email, String endpoint, String p256dhKey, String authKey) {

		this.email = email;
		this.endpoint = endpoint;
		this.p256dhKey = p256dhKey;
		this.authKey = authKey;
		
	}
    
}