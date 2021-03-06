package com.company.idev.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review_comment {
	private int idx;
	private int bd_idx;
	private String id;
	private String content;
	private Timestamp comment_date;
}
