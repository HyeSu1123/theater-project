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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.idev.dto.Members;
import com.company.idev.mapper.MembersMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
//@SessionAttributes("member")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MembersMapper mapper;
	
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
	//회원 로그인
		@GetMapping("/login.do")
		public String login() {
			return "member/MemberLogin";
		}
		@PostMapping("/login.do")
		public String login(Members vo,HttpSession session, RedirectAttributes rda){
			logger.info("login");
			
			session.getAttribute("member");
			Members login = mapper.login(vo);
			boolean passMatch;
			
			if(login != null) {
				passMatch = pwEncoder.matches(vo.getPassword(), login.getPassword());
			}else {
				passMatch = false;
			}
			
			if(login != null && passMatch == true) {
				session.setAttribute("member", login);
				rda.addFlashAttribute("message", "로그인 되었습니다");
				return "redirect:/";
			}else {
				session.setAttribute("member", null);
				rda.addFlashAttribute("message", "아이디나 비밀번호를 다시 입력해주세요");

			}
			return "redirect:login.do";
		}
	//관리자
	@GetMapping("/admin.do")
	public String loginadmin() {
		return "admin/AdminLogin";
	}
	@PostMapping("/admin.do")
	public String loginadmin(Members vo,HttpSession session,RedirectAttributes rda){
		logger.info("admin login");
		
		session.getAttribute("admin");
		Members login = mapper.loginAdmin(vo);
		boolean passMatch;
		
		if(login != null) {
			passMatch = pwEncoder.matches(vo.getPassword(), login.getPassword());
		}else {
			passMatch = false;
		}
		
		if(login.getAuthority() != 0 && passMatch == true) {
			session.setAttribute("admin", null);
			rda.addFlashAttribute("message", "승인 요청중입니다. 현재 이용하실 수 없습니다.");
			return "redirect:admin.do";
		}
		
		if(login != null && passMatch == true) {
			session.setAttribute("admin", login);
			rda.addFlashAttribute("message", "안녕하세요 관리자님.");
			return "redirect:/";
			}else {
				session.setAttribute("admin", null);
				rda.addFlashAttribute("message", "아이디나 비밀번호를 다시 입력해주세요.");
			}
			return "redirect:admin.do";
	}
	//로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session,RedirectAttributes rda) { 
		session.invalidate();
		rda.addFlashAttribute("message", "로그아웃되었습니다.");

		return "redirect:/";
	}
	

}