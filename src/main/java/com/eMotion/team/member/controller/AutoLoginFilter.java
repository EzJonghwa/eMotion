package com.eMotion.team.member.controller;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import com.eMotion.team.member.service.MemberService;
import com.eMotion.team.member.vo.MemberVO;

@Component("autoLoginFilter")
public class AutoLoginFilter extends OncePerRequestFilter {

	 	@Autowired
	    private MemberService memberService;
	 	
	    @Override
	    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
	            throws ServletException, IOException {
	    	
	    	//System.out.println("memberService is null: " + (memberService == null));
	    	
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("login") == null) {
	            Cookie[] cookies = request.getCookies();
	            if (cookies != null) {
	                for (Cookie cookie : cookies) {
	                    if ("autoLogin".equals(cookie.getName())) {
	                        String autoLoginToken = cookie.getValue();
	                        System.out.println("토큰:" + autoLoginToken);

	                        MemberVO login = memberService.findByAutoLoginToken(autoLoginToken);
	                        
	                        System.out.println("findByAutoLoginToken:" + login);

	                        if (login != null) {
	                            session = request.getSession(true);
	                            session.setAttribute("login", login);
	                        }
	                        break;
	                    }
	                }
	            }
	        }

	        filterChain.doFilter(request, response);
	    }
	}