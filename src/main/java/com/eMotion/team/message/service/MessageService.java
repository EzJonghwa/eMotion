package com.eMotion.team.message.service;

import java.util.List;

import com.eMotion.team.message.vo.MessageVO;

public interface MessageService {
    void sendMessage(MessageVO message);
    
    List<MessageVO> getReceivedMessages(String receiverEmail, int startRow, int endRow, String sort);
    List<MessageVO> getSentMessages(String senderEmail, int startRow, int endRow, String sort);

    
    void markMessageAsRead(int msgNo);
    
    void deleteMessages(List<Integer> msgNos, String userType);
    
    void markSenderMessagesAsDeleted(List<Integer> msgNos);
    
    void markReceiverMessagesAsDeleted(List<Integer> msgNos);

	void updateMessageReadStatus(int msgNo);
	
	int countReceivedMessages(String receiverEmail);
	
	int countSentMessages(String senderEmail);
	
	int countUnreadMessages(String receiverEmail);
	
}
