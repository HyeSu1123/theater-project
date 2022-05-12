package com.company.idev.mapper;

import java.util.List;

import com.company.idev.dto.Answer;

public interface AnswerMapper {
	List<Answer> selectAnswer(int idx);
	void insertAnswer(Answer vo);
}
