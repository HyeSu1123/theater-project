package com.company.idev.mapper;

import java.util.List;

import com.company.idev.dto.Performance;

public interface PerformanceMapper {
	int insertPerform(Performance perform);
	List<Performance> selectScheduledPerform();
	List<Performance> selectTicketPerform();
	List<Performance> selectLastPerform();
	Performance getOne(int idx);
	Performance selectNowDetail(int idx);
	Performance selectLastDetail(int idx);
}
