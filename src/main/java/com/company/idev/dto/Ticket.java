package com.company.idev.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ticket {
	private int ticket_no;
	private String id;
	private int schedule_idx;
	private int seat_idx;
	private Timestamp ticket_date;
	private int total_price;
	private int ticket_number;
}
