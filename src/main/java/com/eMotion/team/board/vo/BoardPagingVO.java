package com.eMotion.team.board.vo;


import lombok.Data;

@Data
public class BoardPagingVO {
    private int currentPage;  // 현재 페이지
    private int totalRows;    // 전체 게시글 수
    private int pageSize;     // 한 페이지당 게시글 수
    private int displayPageCount; // 화면에 보여질 페이지 버튼 수

    public BoardPagingVO(int currentPage, int totalRows, int pageSize, int displayPageCount) {
        this.currentPage = currentPage;
        this.totalRows = totalRows;
        this.pageSize = pageSize;
        this.displayPageCount = displayPageCount;
    }

    public int getTotalPages() {
        return (int) Math.ceil((double) totalRows / pageSize);
    }

    public int getStartPage() {
        return Math.max(1, ((currentPage - 1) / displayPageCount) * displayPageCount + 1);
    }

    public int getEndPage() {
        return Math.min(getTotalPages(), getStartPage() + displayPageCount - 1);
    }

    public boolean getHasPrevPageGroup() {  // 메서드 이름 수정
        return getStartPage() > 1;
    }

    public boolean getHasNextPageGroup() {  // 메서드 이름 수정
        return getEndPage() < getTotalPages();
    }
}
