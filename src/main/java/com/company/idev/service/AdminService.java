package com.company.idev.service;

import com.company.idev.dto.Answer;
import com.company.idev.dto.Performance;

public interface AdminService {
	int fileSave(Performance perform);
	void insertAnswer(Answer answer);
}
