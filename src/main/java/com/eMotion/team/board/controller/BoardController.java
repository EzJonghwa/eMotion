package com.eMotion.team.board.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eMotion.team.board.service.BoardService;
import com.eMotion.team.board.service.CommentService;
import com.eMotion.team.board.vo.BoardPagingVO;
import com.eMotion.team.board.vo.BoardSearchVO;
import com.eMotion.team.board.vo.BoardVO;
import com.eMotion.team.member.vo.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	   @Autowired
	    private BoardService boardService;
	   @Autowired
	   	private CommentService commentService;

	    // 게시판 리스트 화면
	   @GetMapping("/list")
	   public String getBoardList(
	           @RequestParam(required = false) String searchType,
	           @RequestParam(required = false) String searchWord,
	           @RequestParam(defaultValue = "1") int page,
	           @RequestParam(defaultValue = "all") String cateNo,
	           @RequestParam(defaultValue = "date") String sort,
	           Model model) {

	       int pageSize = 10; // 한 페이지당 게시글 수
	       int firstRow = (page - 1) * pageSize + 1;
	       int lastRow = page * pageSize;

	       BoardSearchVO searchVO = new BoardSearchVO();
	       searchVO.setSearchType(searchType);
	       searchVO.setSearchWord(searchWord);
	       searchVO.setFirstRow(firstRow);
	       searchVO.setLastRow(lastRow);
	       searchVO.setSort(sort);

	       if (!"all".equals(cateNo)) {
	           searchVO.setCateNo(Integer.parseInt(cateNo));
	       }

	       // 총 행 수 계산
	       int totalRows = boardService.getTotalRowCount(searchVO);
	       BoardPagingVO pagingVO = new BoardPagingVO(page, totalRows, pageSize, 5);

	       // 검색 결과와 페이징 정보를 모델에 추가
	       model.addAttribute("boardList", boardService.getBoardList(searchVO));
	       model.addAttribute("paging", pagingVO);
	       model.addAttribute("selectedCategory", cateNo);
	       model.addAttribute("selectedSort", sort);
	       model.addAttribute("searchType", searchType);
	       model.addAttribute("searchWord", searchWord);

	       return "board/boardListView";
	   }



	    // 게시글 상세보기
	   @GetMapping("/view")
	   public String getBoardDetail(@RequestParam(value = "boNo", required = false, defaultValue = "0") int boNo, 
	                                Model model, HttpSession session, HttpServletResponse response, RedirectAttributes redirectAttributes) {
	       // 캐싱 방지 헤더 추가
		   response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
		   response.setHeader("Pragma", "no-cache");
		   response.setDateHeader("Expires", 0);
	       
	       if (boNo == 0) {
	           redirectAttributes.addFlashAttribute("errorMessage", "유효하지 않은 게시글입니다.");
	           return "redirect:/board/list";
	       }
	       
	       // 조회수 바로 증가
	       boardService.increaseHit(boNo);
	       
	       // 게시글 정보
	       BoardVO board = boardService.getBoard(boNo);
	       if (board == null) {
	           redirectAttributes.addFlashAttribute("errorMessage", "게시글을 찾을 수 없습니다.");
	           return "redirect:/board/list";
	       }

	       model.addAttribute("board", board);
	       model.addAttribute("prevPost", boardService.getPrevPost(boNo)); // 이전 글
	       model.addAttribute("nextPost", boardService.getNextPost(boNo)); // 다음 글
	       model.addAttribute("commentList", commentService.getCommentsByBoNo(boNo)); // 댓글 목록 추가

	       // 로그인 사용자 확인
	       MemberVO loginUser = (MemberVO) session.getAttribute("login");
	       if (loginUser != null) {
	           boolean hasUserRecommended = boardService.hasUserRecommended(boNo, loginUser.getEmail());
	           model.addAttribute("hasUserRecommended", hasUserRecommended);
	       } else {
	           model.addAttribute("hasUserRecommended", false);
	       }

	       return "board/boardDetailView";
	   }


	    
	    // 글 작성 화면
	    @GetMapping("/form")
	    public String boardForm() {
	        return "board/boardWriteView"; // 글 작성
	    }
	    

	 // 글 수정 폼 열기
	    @GetMapping("/editForm")
	    public String editForm(@RequestParam int boNo, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
	        // 게시글 정보 가져오기
	        BoardVO board = boardService.getBoard(boNo);
	        
	        // 현재 로그인한 사용자 확인
	        MemberVO loginUser = (MemberVO) session.getAttribute("login");
	        if (loginUser == null || !board.getEmail().equals(loginUser.getEmail())) {
	            // 비회원이거나 작성자가 아닐 경우 권한 없음 처리
	            redirectAttributes.addFlashAttribute("errorMessage", "수정 권한이 없습니다.");
	            return "redirect:/board/list";
	        }

	        // 게시글 데이터를 모델에 추가
	        model.addAttribute("board", board);
	        return "board/boardEditView"; // 수정 폼 JSP 반환
	    }


	    
	    // 글 수정
	    @PostMapping("/updateDo")
	    public String updateBoard(BoardVO boardVO, HttpSession session) {
	        System.out.println("Received boardVO: " + boardVO); // 전달받은 데이터 확인
	        boardService.updateBoard(boardVO);
	        return "redirect:/board/view?boNo=" + boardVO.getBoNo();
	    }

	    // 글 삭제
	    @PostMapping("/deleteDo")
	    public String deleteBoard(@RequestParam int boNo, HttpSession session) {
	        // 현재 로그인한 사용자 정보 가져오기
	        MemberVO loginUser = (MemberVO) session.getAttribute("login"); 
	        BoardVO board = boardService.getBoard(boNo); // 게시글 정보 가져오기
	        if (loginUser == null || !board.getEmail().equals(loginUser.getEmail())) {
	            // 비회원이거나 작성자가 아닐 경우
	            return "error/unauthorized"; // 권한 없음 페이지로 리다이렉트
	        }
	        boardService.deleteBoard(boNo); // 게시글 삭제
	        return "redirect:/board/list";
	    }
	    
	    // 글 작성
	    @PostMapping("/writeDo")
	    public String writePost(BoardVO boardVO, HttpSession session, RedirectAttributes redirectAttributes) {
	        // 로그인된 사용자 확인
	        MemberVO loginUser = (MemberVO) session.getAttribute("login");
	        if (loginUser == null) {
	            // 로그인되지 않은 사용자는 작성 불가
	            return "redirect:/loginView";
	        }

	        // 작성자 정보를 게시글 객체에 추가
	        boardVO.setEmail(loginUser.getEmail());
	        boardVO.setNickname(loginUser.getNickName());

	        // 게시글 저장
	        boardService.insertBoard(boardVO);
	        redirectAttributes.addFlashAttribute("message", "게시글이 성공적으로 등록되었습니다.");
	        return "redirect:/board/list"; // 게시판 목록으로 리다이렉트
	    }
	    
	    @PostMapping("/recommendDo")
	    public ResponseEntity<?> toggleRecommend(@RequestParam int boNo, HttpSession session) {
	        // 세션에서 로그인 사용자 정보 확인
	        MemberVO loginUser = (MemberVO) session.getAttribute("login");
	        if (loginUser == null) {
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("비회원은 추천할 수 없습니다.");
	        }

	        try {
	            String email = loginUser.getEmail();
	            boardService.toggleRecommend(boNo, email);
	            return ResponseEntity.ok().body("추천 처리 완료");
	        } catch (RuntimeException e) {
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
	        }
	    }

	}
