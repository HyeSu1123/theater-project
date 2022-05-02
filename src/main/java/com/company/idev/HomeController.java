package com.company.idev;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.company.idev.dto.Member;
import com.company.idev.mapper.MemberMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("member")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MemberMapper mapper;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	//로그인
	@GetMapping("/login.do")
	public String login(@ModelAttribute("success") String success) {
		return "member/MemberLogin";
	}
	@PostMapping("/login.do")
	public String login(@RequestParam Map<String,String> map, Model model,HttpSession session){
		Member member=mapper.login(map);
		String url;
		if(member != null) {
			session.setAttribute("member", member);
			model.addAttribute("member",member);
			model.addAttribute("success","y");
			url ="redirect:/";
		}else {
			url ="redirect:login.do?success=n";
		}
		return url;
	}
	//로그아웃
	@GetMapping("/logout.do")
	public String logout(SessionStatus status) { //현재세션 상태 객체
		status.setComplete();	//@SessionAttributes로 설정된 애트리뷰트 값을 clear 한다.
		return "redirect:/";
	}
	

}
