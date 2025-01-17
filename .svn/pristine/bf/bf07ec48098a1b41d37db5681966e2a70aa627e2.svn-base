package com.eMotion.team.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.eMotion.team.member.vo.MemberVO;
import com.eMotion.team.preperCar.vo.PreperCarVO;

public interface MemberService {
	
	public int registMember(MemberVO vo) throws Exception;
	
	public MemberVO loginMember(MemberVO vo) throws Exception;
	
	public String kakaoGetAccessToken(String authorize_code);
	
	public HashMap<String, Object> kakaoGetUserInfo(String access_Token);
	
	public int kakaoRegistMember(MemberVO vo) throws Exception;
	
	public MemberVO kakaoLoginMember(MemberVO vo) throws Exception;
	
	public int emailCheck(String email);
	
	// 자동 로그인
	public void updateAutoLoginToken(MemberVO vo);
	// 자동 로그인
	public MemberVO findByAutoLoginToken(String autoLoginToken);
	
	public void memExit(String email);
	
	public void memUpdate(MemberVO vo);
	// 이미지 업로드
	public String profileUpload(MemberVO vo, String uploadDir, String webPath, MultipartFile file) throws Exception;
	

}
