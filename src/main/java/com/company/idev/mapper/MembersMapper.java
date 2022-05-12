package com.company.idev.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.company.idev.dto.Members;

public interface MembersMapper {
	Members login(Members id);	//암호화 한 후 회원 로그인
	Members loginAdmin(Members id); //암호화 한 후 관리자 로그인
	int checkid(String id);	//아이디 체크
	Members findPassword(String id); //비밀번호 찾기
	int updatePassword(Members email);

	void insert(Members member);	//회원가입
	void insertAdmin(Members admin);	//관리자 가입
	void update(Members member);	//정보 수정
	void delete(Members member);	//회원 탈퇴

	List<Members> list();
	Members getOne(String id);
	void updateAdmin(String id);
	void deleteMember(String id);
	List<Members> getPageList(Map<String,Integer> map);
	int getCount();
	List<Members> search(Map<String,String> map);
	List<Members> searchPageList(@Param("columns") String columns, @Param("find") String find, 
								@Param("startNo") int startNo, @Param("endNo") int endNo);
//	List<Members> searchPageList(Map<String,String> map,Map<String,Integer> map2);
	int getSearchCount(Map<String,String> map);
}