package com.company.idev.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.company.idev.dto.Answer;
import com.company.idev.dto.Members;
import com.company.idev.dto.Question;
import com.company.idev.mapper.AnswerMapper;
import com.company.idev.mapper.QuestionMapper;


@Controller
@RequestMapping(value = "/member")
public class QnAController {
	private static final Logger logger=
			LoggerFactory.getLogger(QnAController.class);

	@Autowired
	QuestionMapper mapper;
	

	
	
	@RequestMapping("/Board1to1")//문의내역 아이디로 검색해서 가져오고 내역 view띄워줌
	public String Board1to1 (Members member,Model model,Question question) {
		String id="id";//추후에 member.getid()로 변경
	
		model.addAttribute("list",mapper.getQuestion(id));
		
		return "one2one/Board1to1";
	}
	
				
	
		
	@RequestMapping("PersonalBoard")
	public String PB() {
		return "one2one/PersonalBoard";
	}
	
	
	@PostMapping("Qinsert")	//질문내용 DB 에저장 이후 문의내역 페이지 전달
	public String Qinsert(Question question,Model model) {
		
		//db등록
		mapper.insert(question);
		
		String id="id";//추후에 member.getid()로 변경
		
		model.addAttribute("list",mapper.getQuestion(id));
			return "one2one/Board1to1";
	}
	
	
	@GetMapping("detail")//문의 내역에서 제목 클릭했을시 세부사항 전달
	 	public String detail(int question_idx,Question question,Answer answer,Model model) {
			question=mapper.getOne(question_idx);
			answer=mapper.getAnswer(question_idx);
			model.addAttribute("getOne",question);
			model.addAttribute("answer",answer);
			return "one2one/detail";
	}
	
	
}
