package com.company.idev.mapper;

import java.util.List;
import java.util.Map;

import com.company.idev.dto.Reviewboard;

public interface ReviewBoardMapper {
	List<Reviewboard> getPageList(Map<String,Integer> map);
	int getCount();
	void insert(Reviewboard dto);
	void update(Reviewboard dto);
	Reviewboard getOne(int idx);
	void readCount(int idx);
	void delete(int idx);
}
