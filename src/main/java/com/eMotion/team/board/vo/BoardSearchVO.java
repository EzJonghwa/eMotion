package com.eMotion.team.board.vo;

import lombok.Data;

@Data
public class BoardSearchVO {
    private String searchType;
    private String searchWord;
    private Integer cateNo; // null 가능
    private String sort;    // 정렬 방식 (recent, hit, recommend)
    private int firstRow;
    private int lastRow;
}
