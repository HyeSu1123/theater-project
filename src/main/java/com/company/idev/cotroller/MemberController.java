package com.company.idev.cotroller;


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
@RequestMapping(value = {"/member","/"})
public class MemberController {
	private static final Logger logger
	= LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberMapper mapper;
	
	@Autowired
	public BCryptPasswordEncoder pwEncoder;
	
	@GetMapping("/join.do")
	public String join() {
		return "member/MemberJoin";
	}
	
	//회원가입
	@PostMapping("/join.do")
	public String appForm(Member member) {
		String rawPw = "";
		String encodePw="";
		
		rawPw = member.getPassword();
		encodePw = pwEncoder.encode(rawPw);
		member.setPassword(encodePw);
		
		mapper.insert(member);
		return "redirect:/login.do";
	}

	//아이디 체크
	@GetMapping("/idCheck.do")
	public String idCheck(String id,Model model) {
		String msg;
		if(mapper.checkid(id) == 0)
			msg="사용가능한 아이디입니다.";
		else msg="사용할 수 없는 아이디입니다.";
		model.addAttribute("id", id);
		model.addAttribute("msg", msg);
		return "member/idCheck";
	}

	
		
	
}