package com.company.idev;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * C:\dev\teamPl\theater-project 여기에 .gitignore 넣어놓고 해봐요 
 * 
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	@RequestMapping(value="memberJoin")
	public String restForm() {
		return "member/MemberJoin";
	} //지금은 push 는 하면 안되요. master 
	
	
	public static void test() {
		//테스트용 메소드 - git  
		//master는 병합할때만 스위치로 바꾸고 항상 Dasan 브랜치에서  
		//다산씨는 ㅇ이상태로 맡은 기능을 구현하면 되요. master하고 병합하는것은 다된다음
	
	}
}
