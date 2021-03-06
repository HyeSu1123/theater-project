package com.company.idev.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.company.idev.dto.Schedules;
import com.company.idev.dto.Seat;
import com.company.idev.mapper.SchedulesMapper;
import com.company.idev.mapper.SeatMapper;

@RestController
public class TicketRestController {
	private static final Logger logger = LoggerFactory.getLogger(TicketRestController.class);
	
	@Autowired
	SchedulesMapper schedules_mapper;
	
	@Autowired
	SeatMapper seat_mapper;
	
	@ResponseBody
	@RequestMapping(value="/asyncticket/{perform_date}-{perform_idx}",method=RequestMethod.GET
	,produces = "application/json;charset=utf-8")
	public String getOne(@PathVariable Date perform_date, @PathVariable int perform_idx) {
		List<Schedules> info = schedules_mapper.selectDate(perform_date,perform_idx);
		Map<String,Object> map = new HashMap<>();
		map.put("info",info);
		ObjectMapper objmapper = new ObjectMapper();
		String json_result=null;
		try {
			json_result = objmapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return json_result;
	}

	@ResponseBody
	@RequestMapping(value="/asyncseat/{checkeditems}",method=RequestMethod.GET
	,produces = "application/json;charset=utf-8")
	public String leftSeat(@PathVariable int[] checkeditems) {
		List<Seat> seats= new ArrayList<>();
		for(int i=0;i<checkeditems.length;i++) {
			Seat vo= seat_mapper.getOne(checkeditems[i]);
			seats.add(vo);
		}
		Map<String,Object> map = new HashMap<>();
		map.put("seats",seats);
		ObjectMapper objmapper = new ObjectMapper();
		String json_result=null;
		try {
			json_result = objmapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return json_result;
	}	

}
