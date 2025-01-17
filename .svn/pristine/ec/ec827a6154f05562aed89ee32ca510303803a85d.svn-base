package com.eMotion.team.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eMotion.team.board.service.CommentService;
import com.eMotion.team.board.vo.CommentVO;
import com.eMotion.team.member.vo.MemberVO;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Autowired
    private CommentService commentService;

    // 댓글 등록
    @PostMapping("/addDo")
    public String addComment(@ModelAttribute CommentVO commentVO, HttpSession session, RedirectAttributes redirectAttributes) {
        MemberVO loginUser = (MemberVO) session.getAttribute("login");
        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "로그인이 필요합니다.");
            return "redirect:/loginView";
        }

        commentVO.setEmail(loginUser.getEmail());
        commentVO.setNickname(loginUser.getNickName());

        commentService.addComment(commentVO);
        commentService.incrementCommentCount(commentVO.getBoNo()); // 댓글 수 증가
        return "redirect:/board/view?boNo=" + commentVO.getBoNo();
    }

    // 댓글 수정
    @PostMapping("/updateDo")
    public String updateComment(@ModelAttribute CommentVO commentVO, HttpSession session, RedirectAttributes redirectAttributes) {
        MemberVO loginUser = (MemberVO) session.getAttribute("login");

        // 로그인 체크 및 작성자 권한 확인
        if (loginUser == null || !commentService.isCommentWriter(commentVO.getCoNo(), loginUser.getEmail())) {
            redirectAttributes.addFlashAttribute("errorMessage", "수정 권한이 없습니다.");
            return "redirect:/board/list";
        }

        try {
            System.out.println("수정 요청 댓글 번호: " + commentVO.getCoNo());

            if (commentVO.getBoNo() == null || commentVO.getBoNo() == 0) {
                // `boNo`가 없으면 댓글 번호로 조회하여 설정
                Integer boNo = commentService.getBoNoByCommentId(commentVO.getCoNo());
                if (boNo == null) {
                    redirectAttributes.addFlashAttribute("errorMessage", "댓글에 해당하는 게시글을 찾을 수 없습니다.");
                    return "redirect:/board/list";
                }
                commentVO.setBoNo(boNo);
                System.out.println("조회된 게시글 번호: " + boNo);
            }

            // 댓글 수정
            commentService.updateComment(commentVO);
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "댓글 수정에 실패했습니다.");
            return "redirect:/board/view?boNo=" + commentVO.getBoNo();
        }

        redirectAttributes.addFlashAttribute("message", "댓글이 수정되었습니다.");
        return "redirect:/board/view?boNo=" + commentVO.getBoNo();
    }


    // 댓글 삭제
    @PostMapping("/deleteDo")
    public String deleteComment(@RequestParam int coNo, HttpSession session, RedirectAttributes redirectAttributes) {
        MemberVO loginUser = (MemberVO) session.getAttribute("login");

        if (loginUser == null || !commentService.isCommentWriter(coNo, loginUser.getEmail())) {
            redirectAttributes.addFlashAttribute("errorMessage", "삭제 권한이 없습니다.");
            return "redirect:/board/view";
        }

        // 댓글 ID로 게시글 번호 조회
        Integer boNo = commentService.getBoNoByCommentId(coNo);
        if (boNo == null) { // boNo가 null인 경우 처리
            redirectAttributes.addFlashAttribute("errorMessage", "댓글을 찾을 수 없습니다.");
            return "redirect:/board/list"; // 기본 경로로 리다이렉트
        }

        // 댓글 삭제 처리
        commentService.deleteComment(coNo);

        redirectAttributes.addFlashAttribute("message", "댓글이 삭제되었습니다.");
        return "redirect:/board/view?boNo=" + boNo; // boNo를 사용하여 게시글로 리다이렉트
    }
}
