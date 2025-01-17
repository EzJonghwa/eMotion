package com.eMotion.team.member.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.eMotion.team.member.vo.MemberVO;

@Mapper
public interface IMemberDAO {
	
	public int registMember(MemberVO vo);
	
	public MemberVO loginMember(MemberVO vo);
	
	public int kakaoRegistMember(MemberVO vo);
	
	public MemberVO kakaoLoginMember(MemberVO vo);
	// 아이디 체크
	public int emailCheck(String email);
	
	// 자동 로그인
	public void updateAutoLoginToken(MemberVO vo);
	// 자동 로그인
	public MemberVO findByAutoLoginToken(@Param("autoLoginToken") String autoLoginToken);
	// 회원탈퇴
	public void memExit(String email);
	
	public void memUpdate(MemberVO vo);
	
	// 프로필이미지 수정
	public int profileUpload(MemberVO vo);
	

}
