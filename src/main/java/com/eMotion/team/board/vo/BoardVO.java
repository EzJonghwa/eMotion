package com.eMotion.team.board.vo;

import java.util.Date;

import lombok.Data;


@Data
public class BoardVO {
	
    private int boNo; // 게시글 번호
    private String boTitle; // 제목
    private String email; // 작성자 이메일
    private String nickname; // 작성자 닉네임
    private String profileImg; // 작성자 이미지
    private String boContent; // 내용
    private int boHit; // 조회수
    private int boRecommend; // 추천 수
    private int calculatedCommentCount; // 새로 추가된 필드
    private int boComment; // 댓글 수
    private Date boRegDate; // 등록일
    private Date boModDate; // 수정일
    private String boDelYn; // 삭제 여부
    private String cateNm; // 카테고리
    private int cateNo;
    private String isNotice;
    
}
