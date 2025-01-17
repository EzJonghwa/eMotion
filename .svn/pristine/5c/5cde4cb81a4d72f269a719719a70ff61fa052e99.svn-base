package com.eMotion.team.board.service;

import java.util.List;
import com.eMotion.team.board.vo.CommentVO;

public interface CommentService {

    void addComment(CommentVO commentVO);

    void updateComment(CommentVO commentVO);

    void deleteComment(int coNo);

    List<CommentVO> getCommentsByBoNo(int boNo);

    boolean isCommentWriter(int coNo, String email);

    Integer getBoNoByCommentId(int coNo);

    void incrementCommentCount(int boNo); // 댓글 수 증가

    void decrementCommentCount(int boNo); // 댓글 수 감소
}
