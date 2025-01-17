package com.eMotion.team.board.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.eMotion.team.board.dao.ICommentDAO;
import com.eMotion.team.board.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private ICommentDAO commentDAO;

    @Override
    public void addComment(CommentVO commentVO) {
        commentDAO.addComment(commentVO); // MyBatis를 통해 DB에 저장
        commentDAO.incrementCommentCount(commentVO.getBoNo()); // 댓글 수 증가
    }

    @Override
    public void updateComment(CommentVO commentVO) {
        commentDAO.updateComment(commentVO);
    }

//    @Override
//    public void deleteComment(int coNo) {
//        // 게시글 번호 조회
//        Integer boNo = commentDAO.getBoNoByCommentId(coNo);
//        if (boNo == null) {
//            throw new IllegalArgumentException("댓글 ID로 게시글 번호를 찾을 수 없습니다.");
//        }
//
//        // 대댓글 개수 확인
//        int childCount = commentDAO.getChildCommentCount(coNo);
//
//        if (childCount > 0) {
//            // 자식 댓글이 있는 경우 부모 댓글을 삭제 상태로 변경
//            commentDAO.deleteParentComment(coNo);
//        } else {
//            // 자식 댓글이 없는 경우 부모 댓글 완전 삭제
//            commentDAO.permanentDeleteComment(coNo);
//        }
//
//        // 자식 대댓글은 삭제 상태로 변경하지 않음
//        // 댓글 수 감소
//        commentDAO.decrementCommentCount(boNo);
//    }
    @Override
    public void deleteComment(int coNo) {
        // 게시글 번호 조회
        Integer boNo = commentDAO.getBoNoByCommentId(coNo);
        if (boNo == null) {
            throw new IllegalArgumentException("댓글 ID로 게시글 번호를 찾을 수 없습니다.");
        }

        // 대댓글 개수 확인
        int childCount = commentDAO.getChildCommentCount(coNo);

        if (childCount > 0) {
            // 자식 댓글이 있는 경우 부모 댓글을 삭제 상태로 변경
            commentDAO.deleteParentComment(coNo);
            // 자식 댓글들을 삭제 상태로 변경
            commentDAO.deleteChildComments(coNo);
        } else {
            // 자식 댓글이 없는 경우 부모 댓글 완전 삭제
            commentDAO.permanentDeleteComment(coNo);
        }

        // 댓글 수 감소
        commentDAO.decrementCommentCount(boNo);
    }


    @Override
    public List<CommentVO> getCommentsByBoNo(int boNo) {
        return commentDAO.getCommentsByBoNo(boNo);
    }

    @Override
    public boolean isCommentWriter(int coNo, String email) {
        String writerEmail = commentDAO.getCommentWriter(coNo);
        return email != null && email.equals(writerEmail);
    }

    @Override
    public Integer getBoNoByCommentId(int coNo) {
        return commentDAO.getBoNoByCommentId(coNo);
    }


    @Override
    public void incrementCommentCount(int boNo) {
        commentDAO.incrementCommentCount(boNo);
    }

    @Override
    public void decrementCommentCount(int boNo) {
        commentDAO.decrementCommentCount(boNo);
    }
}
