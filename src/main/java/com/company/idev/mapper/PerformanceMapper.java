package com.company.idev.mapper;

import java.util.List;

import com.company.idev.dto.Performance;

public interface PerformanceMapper {
	int insertPerform(Performance perform);
	List<Performance> selectScheduledPerform();
	Performance getOne(int idx);
}