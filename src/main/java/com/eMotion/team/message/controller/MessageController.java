package com.eMotion.team.message.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eMotion.team.member.vo.MemberVO;
import com.eMotion.team.message.service.MessageService;
import com.eMotion.team.message.vo.MessageVO;
import com.eMotion.team.push.service.PushNotificationService;

@Controller
public class MessageController {
	
   @Autowired
    private MessageService messageService;
   
   @Autowired
   private PushNotificationService pushService;
	   
   // 받은 쪽지 뷰
   @GetMapping("/messagesViewDo")
   public String messagesViewDo(@RequestParam("receiverEmail") String receiverEmail,
		   @RequestParam(value = "sort", defaultValue = "recent") String sort, 
		   @RequestParam(value = "page", defaultValue = "1") int page, Model model, HttpSession session) {
       // 세션에서 로그인한 사용자의 이메일을 가져옴
       MemberVO login = (MemberVO) session.getAttribute("login");
       
       if (login == null) {
           // 로그인되지 않은 경우
           return "redirect:/loginView"; // 로그인 페이지로 리디렉션
       }
       
       // 로그인한 사용자의 이메일과 receiverEmail을 비교
       if (!login.getEmail().equals(receiverEmail)) {
           // 이메일이 일치하지 않으면 "접근 불가" 메시지와 홈으로 리디렉션
           model.addAttribute("error", "본인의 쪽지함만 확인할 수 있습니다.");
           return "redirect:/";  // 홈 페이지로 리디렉션
       }
       
       int pageSize = 5; // 한 페이지에 표시할 항목 수
       int totalMessages = messageService.countReceivedMessages(receiverEmail);
       int totalPages = (int) Math.ceil(totalMessages / (double) pageSize);
       int unreadMessages = messageService.countUnreadMessages(receiverEmail); // 안 읽은 쪽지 개수

       int startRow = (page - 1) * pageSize + 1;
       int endRow = page * pageSize;

       List<MessageVO> messages = messageService.getReceivedMessages(receiverEmail, startRow, endRow, sort);

       model.addAttribute("messages", messages);
       model.addAttribute("totalPages", totalPages);
       model.addAttribute("totalMessages", totalMessages); // 전체 쪽지 개수
       model.addAttribute("unreadMessages", unreadMessages); // 안 읽은 쪽지 개수
       model.addAttribute("currentPage", page);
       model.addAttribute("sort", sort); // 현재 정렬 조건 전달
       model.addAttribute("tab", "received");
       return "member/messagesView";
   }
   
   // 보낸 쪽지 뷰
   @GetMapping("/sentMessagesViewDo")
   public String sentMessagesViewDo(@RequestParam("senderEmail") String senderEmail, 
		   @RequestParam(value = "page", defaultValue = "1") int page, 
		   @RequestParam(value = "sort", defaultValue = "recent") String sort, 
		   Model model, HttpSession session) {
       // 세션에서 로그인한 사용자의 이메일을 가져옴
       MemberVO login = (MemberVO) session.getAttribute("login");
       
       if (login == null) {
           // 로그인되지 않은 경우
           return "redirect:/loginView"; // 로그인 페이지로 리디렉션
       }

       // 로그인한 사용자의 이메일과 senderEmail을 비교
       if (!login.getEmail().equals(senderEmail)) {
           // 이메일이 일치하지 않으면 "접근 불가" 메시지와 홈으로 리디렉션
           model.addAttribute("error", "본인이 보낸 쪽지만 확인할 수 있습니다.");
           return "redirect:/";  // 홈 페이지로 리디렉션
       }

       int pageSize = 5; // 한 페이지에 표시할 항목 수
       int totalMessages = messageService.countSentMessages(senderEmail);
       int totalPages = (int) Math.ceil(totalMessages / (double) pageSize);

       int startRow = (page - 1) * pageSize + 1;
       int endRow = page * pageSize;

       List<MessageVO> sentMessages = messageService.getSentMessages(senderEmail, startRow, endRow, sort);

       model.addAttribute("sentMessages", sentMessages);
       model.addAttribute("totalPages", totalPages);
       model.addAttribute("totalMessages", totalMessages); // 전체 쪽지 개수
       model.addAttribute("currentPage", page);
       model.addAttribute("sort", sort); // 현재 정렬 조건 전달
       model.addAttribute("tab", "sent");
       return "member/messagesView";
   }

    // 쪽지 전송
   @PostMapping("/sendMessageDo")
   public String sendMessageDo(@ModelAttribute MessageVO message, Model model, HttpSession session) {
       try {
           // 로그인된 사용자의 이메일을 senderEmail에 설정
           MemberVO login = (MemberVO) session.getAttribute("login");
           if (login != null) {
               message.setSenderEmail(login.getEmail());  // 로그인한 사용자의 이메일을 설정
           }
           	
           messageService.sendMessage(message); // 쪽지 전송 처리
           pushService.sendList(message);
           model.addAttribute("success", "쪽지가 성공적으로 전송되었습니다.");

           // 받은 쪽지함으로 리다이렉트
           return "redirect:/messagesViewDo?receiverEmail=" + login.getEmail();
       } catch (Exception e) {
           model.addAttribute("error", "쪽지 전송 중 오류가 발생했습니다.");
           return "redirect:/messagesViewDo?receiverEmail=" + message.getReceiverEmail(); // 기본 리다이렉트
       }
   }

    // 받은 쪽지 확인
    @GetMapping("/getReceivedMessagesDo")
    public String getReceivedMessagesDo(@RequestParam("receiverEmail") String receiverEmail,
 		   @RequestParam(value = "sort", defaultValue = "recent") String sort, 
    		 @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        int pageSize = 5;
        int startRow = (page - 1) * pageSize + 1;
        int endRow = page * pageSize;

        List<MessageVO> messages = messageService.getReceivedMessages(receiverEmail, startRow, endRow, sort);
        model.addAttribute("messages", messages);
        model.addAttribute("sort", sort); // 현재 정렬 조건 전달

        return "member/messagesReceived";
    }

    // 쪽지 읽음 처리
    @PostMapping("/markMessageAsReadDo")
    public String markMessageAsReadDo(@RequestParam("msgNo") int msgNo, @RequestParam("receiverEmail") String receiverEmail) {
        messageService.markMessageAsRead(msgNo); // 읽음 처리
        return "redirect:/messagesView?receiverEmail=" + receiverEmail;
    }
    @ResponseBody
    @PostMapping("/deleteMessageDo")
    public String deleteMessageDo(@RequestParam("msgNos") List<Integer> msgNos, 
                                  @RequestParam("userType") String userType, 
                                  HttpSession session) {
        // 세션에서 로그인 정보 확인
        MemberVO login = (MemberVO) session.getAttribute("login");
        if (login == null) {
            return "login";
        }
        try {
            // 메시지 삭제 처리
            if ("sender".equals(userType)) {
                messageService.markSenderMessagesAsDeleted(msgNos); // 보낸 쪽지 삭제
            } else if ("receiver".equals(userType)) {
                messageService.markReceiverMessagesAsDeleted(msgNos); // 받은 쪽지 삭제
            } else {
                throw new IllegalArgumentException("Invalid userType: " + userType);
            }
            // 리다이렉트 설정
            if ("sender".equals(userType)) {
            	return "sender";
            } else {
                return "receiver";
            }
        } catch (Exception e) {
            return "error";
        }
    }

    @PostMapping("/updateMessageReadStatus")
    @ResponseBody
    public ResponseEntity<?> updateMessageReadStatus(@RequestParam int messageId) {
        try {
            messageService.updateMessageReadStatus(messageId); // 읽음 상태 업데이트
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating read status");
        }
    }

    
    // 게시글 쪽지 보내기
    @PostMapping("/sendSimpleMessage")
    @ResponseBody
    public ResponseEntity<String> sendSimpleMessage(@RequestParam("receiverEmail") String receiverEmail,
                                                    @RequestParam("msgContent") String msgContent,
                                                    HttpSession session) {
        try {
            // 로그인 사용자 확인
            MemberVO login = (MemberVO) session.getAttribute("login");
            if (login == null) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
            }

            // 쪽지 생성 및 전송
            MessageVO message = new MessageVO();
            message.setSenderEmail(login.getEmail());
            message.setReceiverEmail(receiverEmail);
            message.setMsgContent(msgContent);
            
            messageService.sendMessage(message);
            pushService.sendList(message);
            return ResponseEntity.ok("쪽지가 성공적으로 전송되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("쪽지 전송 중 오류가 발생했습니다.");
        }
    }

    @GetMapping("/checkUnreadMessages")
    @ResponseBody
    public boolean checkUnreadMessages(HttpSession session) {
        MemberVO login = (MemberVO) session.getAttribute("login");
        if (login == null) {
            return false; // 로그인되지 않은 경우
        }

        int unreadMessageCount = messageService.countUnreadMessages(login.getEmail());
        return unreadMessageCount > 0; // 안 읽은 쪽지가 있는 경우 true
    }
}
