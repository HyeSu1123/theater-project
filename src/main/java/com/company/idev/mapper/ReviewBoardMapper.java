package com.company.idev.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.company.idev.dto.Performance;
import com.company.idev.dto.Reviewboard;

public interface ReviewBoardMapper {
	List<Reviewboard> getPageList(Map<String,Integer> map);
	int getCount();
	void insert(Reviewboard dto);
	void update(Reviewboard dto);
	Reviewboard getOne(int idx);
	void readCount(int idx);
	void delete(int idx);
	List<Performance> selectTicketPerform();
	List<Reviewboard> getsearch(Map<String,String>map);
	List<Reviewboard> searchPageReview(@Param("columns") String columns, @Param("find") String find, 
			@Param("startNo") int startNo, @Param("endNo") int endNo);
	int getSearchCnt(Map<String,String> map);
}
