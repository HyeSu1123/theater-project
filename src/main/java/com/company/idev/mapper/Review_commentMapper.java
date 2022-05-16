package com.company.idev.mapper;

import java.util.List;

import com.company.idev.dto.Review_comment;

public interface Review_commentMapper {

	void insert(Review_comment dto);

	List<Review_comment> list(int bd_idx);

	void commentCountUp(int idx);

	void delete(int idx);

	void commentCountDown(int idx);

	void updateCmtCount(int idx);
}
