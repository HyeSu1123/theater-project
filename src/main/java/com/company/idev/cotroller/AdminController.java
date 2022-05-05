package com.company.idev.cotroller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.idev.dto.Member;
import com.company.idev.mapper.MemberMapper;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	private static final Logger logger
	= LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberMapper mapper;
	
	@Autowired
	public BCryptPasswordEncoder pwEncoder;
	
	
	@GetMapping("/adminjoin.do")
	public String join() {
		return "admin/AdminJoin";
	}
	
	//회원가입
	@PostMapping("/adminjoin.do")
	public String appForm(Member admin) {
		String rawPw = "";
		String encodePw="";
		
		rawPw = admin.getPassword();
		encodePw = pwEncoder.encode(rawPw);
		admin.setPassword(encodePw);
		
		mapper.insertAdmin(admin);
		return "redirect:/admin.do";
	}

	//아이디 체크
	@GetMapping("/idCheck.do")
	public String idCheck(String id,Model model) {
		String msg;
		Pattern p = Pattern.compile("[\s]");
		Matcher m = p.matcher(id);
		Pattern reg =Pattern.compile("[^a-z0-9]");
		Matcher mreg = reg.matcher(id);
		
		if(mapper.checkid(id) != 0)
			msg="사용할 수 없는 아이디입니다.";
		else if(id=="") {
			msg="사용할 수 없는 아이디입니다.";
		}else if(id.length() < 5 || id.length() > 10) {
			msg="사용할 수 없는 아이디입니다.";
		}else if(m.find()) {
			msg="사용할 수 없는 아이디입니다.";
		}else if(mreg.find()) {
			msg="사용할 수 없는 아이디입니다.";
		}
		else msg="사용가능한 아이디입니다.";
		model.addAttribute("id", id);
		model.addAttribute("msg", msg);
		return "member/idCheck";
	}
	
}
