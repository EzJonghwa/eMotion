package com.eMotion.team.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eMotion.team.board.dao.IBoardDAO;
import com.eMotion.team.board.vo.BoardSearchVO;
import com.eMotion.team.board.vo.BoardVO;


@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private IBoardDAO boardDAO;

    @Override
    public int getTotalRowCount(BoardSearchVO searchVO) {
        return boardDAO.getTotalRowCount(searchVO);
    }

    @Override
    public List<BoardVO> getBoardList(BoardSearchVO searchVO) {
        return boardDAO.getBoardList(searchVO);
    }

    @Override
    public BoardVO getBoard(int boNo) {
        return boardDAO.getBoard(boNo);
    }

    @Override
    public void insertBoard(BoardVO boardVO) {
        boardDAO.insertBoard(boardVO);
    }

    @Transactional
    public void updateBoard(BoardVO boardVO) {
        boardDAO.updateBoard(boardVO);
    }

    @Override
    public void deleteBoard(int boNo) {
        boardDAO.deleteBoard(boNo);
    }

    @Override
    public void increaseHit(int boNo) {
        boardDAO.increaseHit(boNo);
    }
    
    // 추천
    @Override
    @Transactional
    public void toggleRecommend(int boNo, String email) {
        Map<String, Object> params = new HashMap<>();
        params.put("boNo", boNo);
        params.put("email", email);

        // 사용자가 이미 추천했는지 확인
        boolean hasRecommended = boardDAO.hasUserRecommended(params);

        if (hasRecommended) {
            // 추천 취소
            boardDAO.removeRecommend(params);
        } else {
            // 추천 추가
            boardDAO.addRecommend(params);
        }

        // 추천 수 업데이트
        boardDAO.updateRecommendCount(boNo);
    }
    
    @Override
    public boolean hasUserRecommended(int boNo, String email) {
        Map<String, Object> params = new HashMap<>();
        params.put("boNo", boNo);
        params.put("email", email);

        // DAO 호출
        return boardDAO.hasUserRecommended(params);
    }
    
    @Override
    public void updateRecommendCount(int boNo) {
        boardDAO.updateRecommendCount(boNo);
    }

    @Override
    public BoardVO getPrevPost(int boNo) {
        return boardDAO.getPrevPost(boNo);
    }

    @Override
    public BoardVO getNextPost(int boNo) {
        return boardDAO.getNextPost(boNo);
    }

	@Override
	public Object getComments(int boNo) {
		return boardDAO.getCommentsByBoardNo(boNo);
	}
	
	@Override
	public boolean isBoardWriter(int boNo, String email) {
	    BoardVO board = boardDAO.getBoard(boNo);
	    return board.getEmail().equals(email);
	}
	
}