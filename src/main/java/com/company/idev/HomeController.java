package com.company.idev;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
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
import com.company.idev.dto.Notice;
import com.company.idev.dto.Performance;
import com.company.idev.mapper.MembersMapper;
import com.company.idev.mapper.NoticeMapper;
import com.company.idev.mapper.PerformanceMapper;

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
	NoticeMapper notice_mapper;
	
	@Autowired
	PerformanceMapper perform_mapper;
	
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
		List<Notice> listN = notice_mapper.getNoticeList();
		List<Performance> nowlistN = perform_mapper.selectTicketPerform();
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("listN", listN);
		model.addAttribute("nowlistN", nowlistN);
		
		return "home";
	}


	//로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session,RedirectAttributes rda) { 
		session.invalidate();
		rda.addFlashAttribute("message", "로그아웃되었습니다.");

		return "redirect:/";
	}
	//공지
	@GetMapping("/noticedetail.do")
	public String logout(int idx,Model model) { 
		notice_mapper.readCount(idx);
		Notice detail = notice_mapper.selectOne(idx);
		
		model.addAttribute("detail", detail);
		return "notice/noticeDetail";
	}
	
	
	
	@GetMapping("/detailnow.do")
	public String performDetailNow(int idx,Model model) {
		Performance detail = perform_mapper.selectNowDetail(idx);
		model.addAttribute("detail", detail);
		return "perform/performDetail";
	}
}