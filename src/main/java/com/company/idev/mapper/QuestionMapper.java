package com.company.idev.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.company.idev.dto.Question;

public interface QuestionMapper {
	List<Question> selectAll();
	Question selectOne();
	List<Question> getPageList(Map<String,Integer> map);
	int getCount();
	List<Question> searchPageList(@Param("columns") String columns, @Param("find") String find, 
								@Param("startNo") int startNo, @Param("endNo") int endNo);
	int getSearchCount(Map<String,String> map);

}
