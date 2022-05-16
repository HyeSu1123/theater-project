package com.company.idev.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import com.company.idev.dto.Members;

public class AdminLoginInterceptor implements HandlerInterceptor {

private static final Logger log = LoggerFactory.getLogger(AdminLoginInterceptor.class);	

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Members member = (Members)session.getAttribute("member");
		
		if(member == null || member.getAuthority() !=0 ) {
			response.sendRedirect("/member/join.do");
			return false;
		}
		
		return true;
	}
}

