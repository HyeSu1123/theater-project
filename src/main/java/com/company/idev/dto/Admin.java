package com.company.idev.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
	private String id;
	private String password;
	private String name;
	private String birth_date;
	private String gender;
	private String email;
	private String phone;
	private Date reg_date;
	private int authority;
}