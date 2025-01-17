package com.eMotion.team.push.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.eMotion.team.message.vo.MessageVO;
import com.eMotion.team.push.vo.SubscriptionVO;


@Mapper
public interface SubscriptionDAO {
	// 구독 추가
    public void insertSubscription(SubscriptionVO subscription);
    
    public ArrayList<SubscriptionVO> sendToMessage(MessageVO vo);
}
