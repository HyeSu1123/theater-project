package com.company.idev.cotroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.idev.dto.Member;
import com.company.idev.mapper.MemberMapper;
@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger logger
	= LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberMapper mapper;
	
	@GetMapping("/join.do")
	public String join() {
		return "member/MemberJoin";
	}
	
	//ȸ������
	@PostMapping("/join.do")
	public String appForm(Member member) {
		mapper.insert(member);
		return "redirect:../";
	}

	//���̵� �ߺ� üũ
	@GetMapping("/idCheck.do")
	public String idCheck(String id,Model model) {
		String msg;
		if(mapper.checkid(id) == 0)
			msg="����� �� �ִ� ���̵� �Դϴ�.";
		else msg="����� �� ���� �̸��� �Դϴ�.";
		model.addAttribute("id", id);
		model.addAttribute("msg", msg);
		return "member/idCheck";
	}

	
	
}