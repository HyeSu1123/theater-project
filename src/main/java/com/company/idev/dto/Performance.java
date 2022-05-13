package com.company.idev.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Performance {
	private int perform_idx;
	private String perform_title;
	private String poster;
	private int showtime;
	private String grade;
	private Date start_date;
	private Date end_date;
	private String detail;
	
	//MultipartFile 은 form 요소의 file 을 전달받아 참조합니다.//db저장 X
	private MultipartFile pics;
}
