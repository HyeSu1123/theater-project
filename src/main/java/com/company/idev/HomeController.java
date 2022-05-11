package com.company.idev;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.idev.dto.Member;
import com.company.idev.mapper.MemberMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
//@SessionAttributes("member")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MemberMapper mapper;
	@Autowired
	public BCryptPasswordEncoder pwEncoder;
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
	//주석
	//회원 로그인
		@GetMapping("/login.do")
		public String login(@ModelAttribute("success") String success) {
			return "member/MemberLogin";
		}
		@PostMapping("/login.do")
		public String login(Member vo,HttpSession session, RedirectAttributes rttr){
			logger.info("login");
			
			session.getAttribute("member");
			Member login = mapper.login(vo);
			boolean passMatch;
			
			if(login != null) {
				passMatch = pwEncoder.matches(vo.getPassword(), login.getPassword());
			}else {
				passMatch = false;
			}
			
			if(login != null && passMatch == true) {
				session.setAttribute("member", login);
				return "redirect:/";
			}else {
				session.setAttribute("member", null);
			}
			return "redirect:login.do?success=n";
		}
	//관리자
	@GetMapping("/admin.do")
	public String loginadmin(@ModelAttribute("success") String success) {
		return "admin/AdminLogin";
	}
	@PostMapping("/admin.do")
	public String loginadmin(Member vo,HttpSession session){
		logger.info("admin login");
		
		session.getAttribute("admin");
		Member login = mapper.loginAdmin(vo);
		boolean passMatch;
		
		if(login != null) {
			passMatch = pwEncoder.matches(vo.getPassword(), login.getPassword());
		}else {
			passMatch = false;
		}
		
		if(login != null && passMatch == true) {
			session.setAttribute("admin", login);
			return "redirect:/";
			}else {
				session.setAttribute("admin", null);
			}
			return "redirect:admin.do?success=n";
	}
	//로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session) { 
		session.invalidate();
		return "redirect:/";
	}
	

}