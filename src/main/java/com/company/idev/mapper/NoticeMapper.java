package com.company.idev.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.company.idev.dto.Notice;

public interface NoticeMapper {
	List<Notice> selectAll();
	Notice selectOne(int idx);
	void updateNotice(@Param("notice_title") String title, @Param("notice_content") String content,@Param("notice_idx") int idx);
	//void updateNotice(Notice notice);
	void deleteNotice(int idx);
	List<Notice> getPageList(Map<String,Integer> map);
	int getCount();
	List<Notice> search(Map<String,String> map);
	List<Notice> searchPageList(@Param("columns") String columns, @Param("find") String find, 
								@Param("startNo") int startNo, @Param("endNo") int endNo);
	int getSearchCount(Map<String,String> map);
	void readCount(int idx);
	void insertNotice(Notice vo);

	List<Notice> getNoticeList(Map<String,Integer> map);
}