package com.company.idev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.company.idev.dto.Question;
import com.company.idev.mapper.QuestionMapper;

@Controller
public class QnAController {

	@Autowired
	public QuestionMapper mapper;
	
	@PostMapping("question")
	public String insert(Question dto) {
		mapper.insert(dto);
		return "board1to1"; //첫화면은 문의 신청 페이지 였음 문의 완료하면 문의 내역으로 넘어감
		
	}
}
