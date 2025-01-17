package com.eMotion.team.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.eMotion.team.board.vo.BoardSearchVO;
import com.eMotion.team.board.vo.BoardVO;
import com.eMotion.team.board.vo.CommentVO;

@Mapper
public interface IBoardDAO {

    // 전체 게시글 수 조회
    int getTotalRowCount(BoardSearchVO searchVO);
    
    // 게시글 목록 조회
    List<BoardVO> getBoardList(BoardSearchVO searchVO);
    
    // 특정 게시글 조회
    BoardVO getBoard(int boNo);
    
    // 게시글 등록
    void insertBoard(BoardVO boardVO);
    
    // 게시글 수정
    void updateBoard(BoardVO boardVO);
    
    // 게시글 삭제
    void deleteBoard(int boNo);
    
    // 게시글 조회수 증가
    void increaseHit(int boNo);

    // 이전 게시글 조회
    BoardVO getPrevPost(int boNo);
    
    // 다음 게시글 조회
    BoardVO getNextPost(int boNo);

    // 특정 게시글에 대한 댓글 목록 조회
    List<CommentVO> getCommentsByBoardNo(int boNo);
    
    // 게시글 목록 조회 (검색 포함)
    List<BoardVO> selectBoardList(BoardSearchVO searchVO);
    
    // 검색 조건에 따른 전체 게시글 수 조회
    int selectTotalRowCount(BoardSearchVO searchVO);

    // 사용자가 특정 게시글에 추천했는지 여부 확인
    boolean hasUserRecommended(Map<String, Object> params);

    // 특정 게시글에 추천 추가
    void addRecommend(Map<String, Object> params);

    // 특정 게시글에 대한 추천 제거
    void removeRecommend(Map<String, Object> params);

    // 게시글 추천 수 업데이트
    void updateRecommendCount(int boNo);
}
