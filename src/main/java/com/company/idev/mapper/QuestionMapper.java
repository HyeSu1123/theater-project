package com.company.idev.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.company.idev.dto.Answer;
import com.company.idev.dto.Question;

public interface QuestionMapper {
	//1:1문의
	void insert(Question question); //질문  db저장
	List<Question> getQuestion(String id);//세션에 저장된 id로 질문한 모든질문 가져옴
	Question getOne (int question_idx);//질문들중 하나 detail
	Answer getAnswer(int question_idx);
	
	
	//1:1답변
	List<Question> selectAll();
	Question selectOne(int idx);
	void updateStatus(int idx);
	List<Question> getPageList(Map<String,Integer> map);
	int getCount();
	List<Question> searchPageList(@Param("columns") String columns, @Param("find") String find, 
								@Param("startNo") int startNo, @Param("endNo") int endNo);
	int getSearchCount(Map<String,String> map);

}
