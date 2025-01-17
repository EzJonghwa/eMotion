package com.eMotion.team.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eMotion.team.message.dao.IMessageDAO;
import com.eMotion.team.message.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private IMessageDAO messageDAO;

    @Override
    public void sendMessage(MessageVO message) {
        messageDAO.insertMessage(message);
    }

    @Override
    public List<MessageVO> getReceivedMessages(String receiverEmail, int startRow, int endRow, String sort) {
        Map<String, Object> params = new HashMap<>();
        params.put("receiverEmail", receiverEmail);
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        params.put("sort", sort);

        return messageDAO.getReceivedMessages(params);
    }

    @Override
    public List<MessageVO> getSentMessages(String senderEmail, int startRow, int endRow, String sort) {
        Map<String, Object> params = new HashMap<>();
        params.put("senderEmail", senderEmail);
        params.put("startRow", startRow);
        params.put("endRow", endRow);
        params.put("sort", sort);

        return messageDAO.getSentMessages(params);
    }

    @Override
    public void markMessageAsRead(int msgNo) {
        messageDAO.updateMessageReadStatus(msgNo);
    }

    @Override
    public void deleteMessages(List<Integer> msgNos, String userType) {
        for (int msgNo : msgNos) {
            if ("sender".equals(userType)) {
                messageDAO.deleteSenderMessage(msgNo);
            } else if ("receiver".equals(userType)) {
                messageDAO.deleteReceiverMessage(msgNo);
            }
        }
    }
    
    @Override
    public void markSenderMessagesAsDeleted(List<Integer> msgNos) {
        msgNos.forEach(msgNo -> messageDAO.updateSenderMessageAsDeleted(msgNo));
    }

    @Override
    public void markReceiverMessagesAsDeleted(List<Integer> msgNos) {
        msgNos.forEach(msgNo -> messageDAO.updateReceiverMessageAsDeleted(msgNo));
    }

	@Override
	public void updateMessageReadStatus(int msgNo) {
		messageDAO.updateMessageReadStatus(msgNo);
		
	}
	
    @Override
    public int countReceivedMessages(String receiverEmail) {
        return messageDAO.countReceivedMessages(receiverEmail);
    }
    
    @Override
    public int countSentMessages(String senderEmail) {
        return messageDAO.countSentMessages(senderEmail);
    }
    
    @Override
    public int countUnreadMessages(String receiverEmail) {
        return messageDAO.countUnreadMessages(receiverEmail);
    }
}