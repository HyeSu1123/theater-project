package com.company.idev.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import com.company.idev.dto.Members;

public class MemberLoginInterceptor implements HandlerInterceptor {

private static final Logger log = LoggerFactory.getLogger(MemberLoginInterceptor.class);	

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Members member = (Members) session.getAttribute("member");
		if(member == null) {	
			String msg="로그인 하세요.";
			//String url=request.getContextPath();

			
						
			return false;		//요청에 정해진 handler 메소드로 제어(실행)가 이동되지 않습니다.
		}else {
		//로그인 된 상태이므로 요청에 따라 handler 메소드로 이동합니다.
			return true;
		}
	}
}

