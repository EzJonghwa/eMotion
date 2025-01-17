package com.eMotion.team.board.service;

import java.util.List;


import com.eMotion.team.board.vo.BoardSearchVO;
import com.eMotion.team.board.vo.BoardVO;

public interface BoardService {
	    int getTotalRowCount(BoardSearchVO searchVO);
	   
	    List<BoardVO> getBoardList(BoardSearchVO searchVO);
	    
	    BoardVO getBoard(int boNo);
	    
	    void insertBoard(BoardVO boardVO);
	    
	    void updateBoard(BoardVO boardVO);
	    
	    void deleteBoard(int boNo);
	    
	    void increaseHit(int boNo);

	    void toggleRecommend(int boNo, String email);

	    void updateRecommendCount(int boNo);

		Object getPrevPost(int boNo);

		Object getNextPost(int boNo);

		Object getComments(int boNo);
		
		boolean isBoardWriter(int boNo, String email);

		boolean hasUserRecommended(int boNo, String email);
		
}
