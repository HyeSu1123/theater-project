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
			String msg="로그인해주세";
			String url=request.getContextPath();

			response.setContentType("text/html;charset=utf-8"); 
			PrintWriter out = response.getWriter(); 
			StringBuilder alerts = new  StringBuilder("<script>alert('") 
					  .append(msg)
					  .append("');")
					  .append("location.href='")
					  .append(url)
					  .append("';")
					  .append("</script>"); 
			out.print(alerts.toString()); 
			//out.flush();	//출력버퍼 비우기
			
						
			return false;	
		}else {
		
			return true;
		}
	}
}

