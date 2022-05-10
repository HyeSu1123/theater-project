package com.company.idev.mapper;

import java.util.List;
import java.util.Map;

import com.company.idev.dto.Member;


public interface MemberMapper {
	//Member login(Map<String, String> map);	//암호화 하기전 회원 로그인
	//Member loginadmin(Map<String, String> map); //관리자 로그인

	List<Member> selectAll();
	Member login(Member id);	//암호화 한 후 회원 로그인
	Member loginAdmin(Member id);
	int checkid(String id);	//아이디 체크

	Member findPassword(String id);
	int updatePassword(Member email);
	
	void insert(Member member);	//회원가입
	void insertAdmin(Member admin);	//관리자 가입
	void update(Member member);	//정보 수정
	void delete(Member member);	//회원 탈퇴
	
}