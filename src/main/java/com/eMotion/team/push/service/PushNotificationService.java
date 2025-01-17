package com.eMotion.team.push.service;
import java.security.Security;
import java.util.List;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.eMotion.team.message.vo.MessageVO;
import com.eMotion.team.push.dao.SubscriptionDAO;
import com.eMotion.team.push.vo.SubscriptionVO;

import nl.martijndwars.webpush.Notification;
import nl.martijndwars.webpush.PushService;
import nl.martijndwars.webpush.Subscription;
@Service
public class PushNotificationService {
	

    @Value("${vapid.publicKey}")
	private String publicKey;
	
	@Value("${vapid.privateKey}")
	private String privateKey;
	
	@Value("${vapid.subject}")
	private String subject;
	
	@Autowired
    private SubscriptionDAO subscriptionDao;
	
	
	public PushNotificationService() {
		if(Security.getProvider("BC") == null) {
			// web push protocol에서 메시지를 암호화하고 복화화히기 위해 추가			
			Security.addProvider(new BouncyCastleProvider());
		}
	}
	public void insertSubscription(SubscriptionVO subscription) {
	   	subscriptionDao.insertSubscription(subscription);
	}
	   
	public void sendPush(Subscription subscription, String title, String body) {
		PushService pushService = new PushService();
		try {
			pushService.setPublicKey(publicKey);
			pushService.setPrivateKey(privateKey);
			pushService.setSubject(subject);
			
			String payload = String.format("{\"title\":\"%s\", \"body\":\"%s\"}", title, body);
			Notification notification = new Notification(subscription, payload);
			pushService.send(notification);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	  // 푸시 알림 전송 로직
    public void sendPushChat(Subscription subscription, String title, String body, String from, String to) {
        PushService pushService = new PushService();
        try {
            pushService.setPublicKey(publicKey);
            pushService.setPrivateKey(privateKey);
            pushService.setSubject(subject);
            // 푸시 알림에 포함할 데이터
            String payload = String.format(
                "{\"title\":\"%s\", \"body\":\"%s\", \"senderEmail\":\"%s\", \"receiverEmail\":\"%s\"}",
                title, body, from, to
            );
            // 알림 생성 및 전송
            Notification notification = new Notification(subscription, payload);
            pushService.send(notification);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	public void sendList(MessageVO message) {
	    	String from = message.getSenderEmail();
	    	String to = message.getReceiverEmail();
	    	List<SubscriptionVO> pushList = subscriptionDao.sendToMessage(message);
	    	for(int i = 0 ; i < pushList.size(); i ++) {
	    		SubscriptionVO subVO = pushList.get(i);
	    		to = subVO.getEmail();
//	    		// Subscription.Keys 객체 생성
	    		Subscription.Keys keys = new Subscription.Keys(subVO.getP256dhKey(), subVO.getAuthKey());
//	    		// Subscription 객체 생성
	    		Subscription sub = new Subscription(subVO.getEndpoint(), keys);
	    		sendPushChat(sub, to + "님 " + from + " 에게 메세지 왔습니다.", message.getMsgContent() ,from ,to);
	    		System.out.println("push 나옴?");
	    	}
	    }
	
	
}
