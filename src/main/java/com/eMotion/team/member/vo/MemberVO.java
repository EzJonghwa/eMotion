package com.eMotion.team.member.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	private String email;
	private String password;
	private String nickName;
	private String addr;
	private String birthYear;
	private String kakaoYn;
	private String autoLoginToken; // 자동 로그인 토큰 필드 추가
	private String profileImg;
	private String saveCar;
	private String notOwner;
}
