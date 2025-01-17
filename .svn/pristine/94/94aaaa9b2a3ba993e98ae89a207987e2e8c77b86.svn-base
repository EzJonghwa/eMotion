package com.eMotion.team.message.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.eMotion.team.message.vo.MessageVO;
@Mapper
public interface IMessageDAO {
	
    void insertMessage(MessageVO message);
    List<MessageVO> getReceivedMessages(Map<String, Object> params);
    List<MessageVO> getSentMessages(Map<String, Object> params);
    void deleteSenderMessage(int msgNo);
    void deleteReceiverMessage(int msgNo);
    void updateMessageReadStatus(int msgNo);
    void updateSenderMessageAsDeleted(int msgNo);
    void updateReceiverMessageAsDeleted(int msgNo);
    int countReceivedMessages(String receiverEmail);
    int countSentMessages(String senderEmail);
    int countUnreadMessages(String receiverEmail);
}
