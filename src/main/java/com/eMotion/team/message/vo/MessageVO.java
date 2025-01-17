package com.eMotion.team.message.vo;

import java.util.Date;

import lombok.Data;
@Data
public class MessageVO {
    private int msgNo;
    private String senderEmail;
    private String senderNickname; // 추가: 보내는 사람의 닉네임
    private String receiverEmail;
    private String receiverNickname; // 추가: 받는 사람의 닉네임
    private String msgContent;
    private Date msgSendDate;
    private String msgRead;
    private String receiverDelYn;
    private String senderDelYn;
    
}
