package com.eMotion.team.board.dao;

import java.util.List;
import com.eMotion.team.board.vo.CommentVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ICommentDAO {

    void addComment(CommentVO commentVO);

    void updateComment(CommentVO commentVO);
    
    void deleteComment(int coNo);

    List<CommentVO> getCommentsByBoNo(int boNo);

    String getCommentWriter(int coNo);

    Integer getBoNoByCommentId(int coNo);

    void incrementCommentCount(int boNo); // 댓글 수 증가

    // 대댓글 개수 확인
    int getChildCommentCount(int coNo);

    // 부모 댓글 완전 삭제
    void permanentDeleteComment(int coNo);

    // 댓글 수 감소
    void decrementCommentCount(int boNo);

	void deleteParentComment(int coNo);

	void deleteChildComments(int coNo);
    
}