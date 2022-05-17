package com.company.idev.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.idev.dto.Answer;
import com.company.idev.dto.Members;
import com.company.idev.dto.Question;
import com.company.idev.mapper.QuestionMapper;


@Controller
@RequestMapping(value = "/member")
public class QnAController {
	private static final Logger logger=
			LoggerFactory.getLogger(QnAController.class);

	@Autowired
	QuestionMapper mapper;
	

	
	
	@RequestMapping("Board1to1.do")//문의내역 아이디로 검색해서 가져오고 내역 view띄워줌
	public String Board1to1 (Members member,Model model,HttpSession session) {
		Members id = (Members)session.getAttribute("member");
		model.addAttribute("list",mapper.getQuestion(id.getId()));
		return "one2one/Board1to1";
	}
	
				
	
		
	@GetMapping("/qinsert.do")
	public String PB() {
		return "one2one/PersonalBoard";
	}
	
	
	@PostMapping("/qinsert.do")	//질문내용 DB 에저장 이후 문의내역 페이지 전달
	public String Qinsert(Members member,Question question,Model model) {
		
		//db등록
		mapper.insert(question);
		
		String id=member.getId();//추후에 member.getid()로 변경
		
		//model.addAttribute("list",mapper.getQuestion(id));
			return "redirect:Board1to1.do";
	}
	
	
	@GetMapping("/detail.do")//문의 내역에서 제목 클릭했을시 세부사항 전달
	 	public String detail(int question_idx,Question question,Answer answer,Model model) {
			question=mapper.getOne(question_idx);
			answer=mapper.getAnswer(question_idx);
			model.addAttribute("getOne",question);
			model.addAttribute("answer",answer);
			return "one2one/detail";
	}
	
	
}