package com.company.idev.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reviewboard {
	private int idx;
	private String id;
	private String subject;
	private String title;
	private String content;
	private int readCount;
	private Date wdate;
	private int commentCount;
}
