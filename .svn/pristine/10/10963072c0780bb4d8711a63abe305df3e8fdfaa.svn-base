package com.eMotion.team.board.vo;

import java.util.Date;

import lombok.Data;


@Data
public class CommentVO {
    private int coNo;          // 댓글 번호
    private Integer boNo;          // 게시글 번호
    private String coContent;  // 댓글 내용
    private String email;      // 작성자 이메일
    private String nickname;   // 작성자 닉네임
    private Date coRegDate;     // 작성일 (Date 타입으로 변경)
    private Date coModDate;     // 수정일 (Date 타입으로 변경)
    private String coDelYn;    // 삭제 여부 ('Y' or 'N')
    private Integer coParentId; // 부모 댓글 ID (대댓글일 경우)
    private String profileImg; // 작성자 프로필 이미지 경로
}