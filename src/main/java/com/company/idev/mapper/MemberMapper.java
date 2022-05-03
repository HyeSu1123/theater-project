package com.company.idev.mapper;

import java.util.List;
import java.util.Map;

import com.company.idev.dto.Member;


public interface MemberMapper {
	List<Member> selectAll();
	//Member login(Map<String, String> map);	//�쉶�썝 濡쒓렇�씤
	Member login(Member id);
	Member loginadmin(Map<String, String> map); //愿�由ъ옄濡쒓렇�씤
	int checkid(String id);
	void insert(Member member);	//�쉶�썝媛��엯
	void insertAdmin(Member admin);	//愿�由ъ옄 媛��엯
	void update(Member member);
	void delete(Member member);
	
}
