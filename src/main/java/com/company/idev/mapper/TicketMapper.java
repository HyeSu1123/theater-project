package com.company.idev.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.idev.dto.Ticket;

public interface TicketMapper {
	void insertTicket(Ticket vo);
	List<Ticket> getTicket(int ticket_no);
	List<Ticket> getIdTicket(@Param("id") String id);
}
