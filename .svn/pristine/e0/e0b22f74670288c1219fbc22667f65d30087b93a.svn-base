package com.eMotion.team.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eMotion.team.member.service.MemberService;
import com.eMotion.team.member.vo.MemberVO;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Value("${file.upload.path}")
	private String CURR_IMAGE_PATH;

	@Value("${file.download.path}")
	private String WEB_PATH;
	
//	@Value("#{util['file.upload.path']}")
//	private String CURR_IMAGE_PATH;
//	
//	@Value("#{util['file.download.path']}")
//	private String WEB_PATH;
	
	
	// 회원가입 창 띄우기
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
	
	// 회원가입 실행
	@RequestMapping("/registDo")
	public String registDo(MemberVO vo, HttpSession session) {
		
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		System.out.println(vo);
		
		try {
			memberservice.registMember(vo);
			MemberVO login = memberservice.loginMember(vo);
			System.out.println("회원가입 : " + login);
			session.setAttribute("login", login);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/saveListView";
	}
	
	// 로그인 창 띄우기
	@RequestMapping("/loginView")
	public String logibView() {
		return "member/loginView";
	}
	
	// 로그인 실행
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo,
						  @RequestParam(value = "remember", required = false)boolean remember,
						  @RequestParam(value = "autoLogin", required = false) boolean autoLogin,
						  HttpSession session,
						  HttpServletResponse response,
						  RedirectAttributes redirectAttributes) {
		
		try {
			MemberVO login = memberservice.loginMember(vo);
			// 입력한 비밀번호와 db의 암호화된 비번 비교 일치하면 true, 그렇지 않으면 false 반환
			boolean match = passwordEncoder.matches(vo.getPassword(), login.getPassword());
			//System.out.println(match);
			if(login == null || !match) {
				redirectAttributes.addFlashAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
				return "redirect:/loginView";
			}
			
			session.setAttribute("login", login);
			
			System.out.println(login.getKakaoYn());
			
			// 아이디 저장 기능
			if(remember) {
				// 쿠키생성
				Cookie cookie = new Cookie("rememberId", login.getEmail());
				cookie.setMaxAge(30 * 24 * 60 * 60); // 30일
	            cookie.setPath("/");
				response.addCookie(cookie);
			} else {
				// 쿠키 삭제
				// 동일한 key 값을 가지는 쿠키의 유효시간을 0으로
				Cookie cookie = new Cookie("rememberId", "");
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
			
			// 자동 로그인 (autoLogin)
	        if (autoLogin) {
	            String autoLoginToken = UUID.randomUUID().toString();
	            System.out.println(autoLoginToken);
	            
	            // MemberVO에 autoLoginToken 설정
	            login.setAutoLoginToken(autoLoginToken);
	            
	            // DB에 토큰 저장
	            memberservice.updateAutoLoginToken(login);

	            // 쿠키에 토큰 저장
	            Cookie autoLoginCookie = new Cookie("autoLogin", autoLoginToken);
	            autoLoginCookie.setMaxAge(30 * 24 * 60 * 60); // 30일
	            autoLoginCookie.setHttpOnly(true); // 보안 설정
	            autoLoginCookie.setPath("/");
	            response.addCookie(autoLoginCookie);
	        }else {
				// 쿠키 삭제
				// 동일한 key 값을 가지는 쿠키의 유효시간을 0으로
				Cookie autoLoginCookie = new Cookie("autoLogin", "");
				autoLoginCookie.setMaxAge(0);
				autoLoginCookie.setPath("/");
				response.addCookie(autoLoginCookie);
			}
			
	        if("Y".equals(login.getSaveCar())){
	        	return "redirect:/";
	        }else if("Y".equals(login.getNotOwner())){
	        	return "redirect:/";
	        }else {
	        	return "redirect:/saveListView";
	        }
	        
	        
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("loginError", "사용할 수 없는 아이디입니다. 다시 입력해주세요.");
			return "redirect:/loginView";
		}
		
		//return "redirect:/";
		
	}
	
	@RequestMapping("/logoutDo")
    public String logout(HttpSession session, HttpServletResponse response) {
        session.invalidate();
        
        // 자동로그인 쿠키 삭제
        Cookie autoLoginCookie = new Cookie("autoLogin", "");
        autoLoginCookie.setMaxAge(0);
        autoLoginCookie.setPath("/");
        response.addCookie(autoLoginCookie);
        
        return "redirect:/"; // 로그아웃 후 로그인 페이지로 이동
    }
	
	@RequestMapping(value="/kakaologin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code,
			                                                                 HttpSession session,
			                                                                 MemberVO vo,
			                                                                 Model model,
			                                                                 @RequestParam(value = "state", required = false) String state,
			                                                                 HttpServletResponse response) throws Exception {
		
		//System.out.println("#########" + code);
		
		// 위에서 만든 코드 아래에 코드 추가
		String access_Token = memberservice.kakaoGetAccessToken(code);
		//System.out.println("###access_Token#### : " + access_Token);

		// 위에서 만든 코드 아래에 코드 추가
		HashMap<String, Object> userInfo = memberservice.kakaoGetUserInfo(access_Token);
		//System.out.println("###nickName#### : " + userInfo.get("nickName"));
		//System.out.println("###email#### : " + userInfo.get("email"));
		
		// 3. 세션에 저장
		session.setAttribute("userInfo", userInfo);
		
		// 4. Email 체크
	    String email = (String) userInfo.get("email");
	    
	    System.out.println(email);

	    if (email == null || email.isEmpty()) {
	        // 이메일이 없으면 회원가입 페이지로 이동
	    	return "redirect:/kakaoRegistView";
	    } else {
	        // 이메일이 있으면 로그인 로직 실행
	        vo.setEmail(email);
	        vo.setPassword(""); // 카카오 로그인은 비밀번호가 없으므로 기본값 설정

	        try {
	            MemberVO login = memberservice.kakaoLoginMember(vo);

	            if (login != null) {
	            	
	                session.setAttribute("login", login);
	                
	                // 자동 로그인 (autoLogin)
	                System.out.println(state);
	                boolean autoLogin = false;
	                if (state != null) {
	                	ObjectMapper objectMapper = new ObjectMapper();
	                    try {
	                        Map<String, Object> stateData = objectMapper.readValue(state, Map.class);
	                        autoLogin = Boolean.parseBoolean(stateData.get("autoLogin").toString());
	                    } catch (Exception e) {
	                        e.printStackTrace();
	                    }
	                }
	                
	                System.out.println(autoLogin);
	    	        if (autoLogin) {
	    	            String autoLoginToken = UUID.randomUUID().toString();
	    	            System.out.println(autoLoginToken);
	    	            
	    	            // MemberVO에 autoLoginToken 설정
	    	            login.setAutoLoginToken(autoLoginToken);
	    	            
	    	            // DB에 토큰 저장
	    	            memberservice.updateAutoLoginToken(login);

	    	            // 쿠키에 토큰 저장
	    	            Cookie autoLoginCookie = new Cookie("autoLogin", autoLoginToken);
	    	            autoLoginCookie.setMaxAge(30 * 24 * 60 * 60); // 30일
	    	            autoLoginCookie.setHttpOnly(true); // 보안 설정
	    	            autoLoginCookie.setPath("/");
	    	            response.addCookie(autoLoginCookie);
	    	        }else {
	    				// 쿠키 삭제
	    				// 동일한 key 값을 가지는 쿠키의 유효시간을 0으로
	    				Cookie autoLoginCookie = new Cookie("autoLogin", "");
	    				autoLoginCookie.setMaxAge(0);
	    				autoLoginCookie.setPath("/");
	    				response.addCookie(autoLoginCookie);
	    			}
	                
	    	        if("Y".equals(login.getSaveCar())){
	    	        	return "redirect:/";
	    	        }else if("Y".equals(login.getNotOwner())){
	    	        	return "redirect:/";
	    	        }else {
	    	        	return "redirect:/saveListView";
	    	        }
	    	        
	            }
	        } catch (Exception e) {
	            System.out.println("로그인 실패: " + e.getMessage());
	        }

	        // DB에 정보가 없으면 회원가입 페이지로 이동
	        model.addAttribute("error", "로그인 실패: 계정이 존재하지 않습니다.");
	        
	        return "redirect:/kakaoRegistView";
	    }
    }
	
	@RequestMapping("/kakaoRegistView")
	public String kakaoRegistView(HttpSession session, Model model) {
	    // 에러 메시지가 있으면 모델에 추가
	    String errorMessage = (String) session.getAttribute("error");
	    if (errorMessage != null) {
	        model.addAttribute("error", errorMessage);
	        session.removeAttribute("error"); // 에러 메시지를 세션에서 제거
	    }
	    System.out.println("회원가입 페이지 이동");

	    return "member/kakaoRegistView";
	}
	
	
	@RequestMapping("/kakaoRegistDo")
	public String kakaoRegistDo(MemberVO vo, HttpSession session) {
		
		System.out.println(vo);
		vo.setPassword(passwordEncoder.encode(vo.getPassword()));
		
		try {
			memberservice.kakaoRegistMember(vo);
			MemberVO login = memberservice.kakaoLoginMember(vo);
			System.out.println("카카오회원가입 : " + login);
			session.setAttribute("login", login);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/saveListView";
	}
	
	// 아이디 중복체크
	@RequestMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		int cnt = memberservice.emailCheck(email);
		return cnt;
	}
	
	// 마이페이지
	@RequestMapping("/mypageRewrite")
	public String mypageView() {
		return "member/mypageRewrite";
	}
	
	// 마이페이지
	@RequestMapping("/kakaomypageRewrite")
	public String kakaoMypageView() {
		return "member/kakaomypageRewrite";
	}
	
	// 회원탈퇴
	@RequestMapping("/emailExit")
	@ResponseBody
	public String memExit(@RequestParam ("email") String email, HttpSession session) {
		
		System.out.println(email);
		
		session.invalidate();
		
		memberservice.memExit(email);
		
		return "seccess";
	}
	
	// 로컬 마이페이지 수정
	@RequestMapping("/updateMypage")
	public String updateMypage(MemberVO vo, HttpSession session, Model model) {
		
		System.out.println(vo);
		memberservice.memUpdate(vo);
		
		System.out.println(CURR_IMAGE_PATH);
		System.out.println(WEB_PATH);
		
		try {
			MemberVO login = memberservice.loginMember(vo);
			
			session.setAttribute("login", login);
			
			System.out.println(login);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mypageRewrite";
	}
	
	// 카카오 마이페이지 수정
	@RequestMapping("/updateKakaoMypage")
	public String updateKakaoMypage(MemberVO vo, HttpSession session, Model model) {
		
		System.out.println(vo);
		memberservice.memUpdate(vo);
		
		try {
			MemberVO login = memberservice.kakaoLoginMember(vo);
			
			session.setAttribute("login", login);
			
			System.out.println(login);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/kakaomypageRewrite";
	}
	
	// 이미지 업로드
	@ResponseBody
	@PostMapping("/files/upload")
	public Map<String, Object> uploadFiles(HttpSession session, @RequestParam("uploadImage") MultipartFile uploadImage) throws Exception{
		
		MemberVO vo = (MemberVO) session.getAttribute("login");
		String imgPath = memberservice.profileUpload(vo, CURR_IMAGE_PATH, WEB_PATH, uploadImage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("message", "success");
		map.put("imagePath", imgPath);
		
		return map; // map을 json 데이터로 리턴
	}

	
}
