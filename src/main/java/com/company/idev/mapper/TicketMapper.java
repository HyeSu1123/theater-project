package com.company.idev.mapper;

import java.util.List;

import com.company.idev.dto.Ticket;

public interface TicketMapper {
	void insertTicket(Ticket vo);
	List<Ticket> getTicket(int ticket_no);
}
