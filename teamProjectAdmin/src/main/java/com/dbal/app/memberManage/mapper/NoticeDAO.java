package com.dbal.app.memberManage.mapper;

import java.util.List;

import com.dbal.app.memberManage.Notice;

public interface NoticeDAO {
	//전체 조회
	public List<Notice> selectAll(Notice noticeVO);
	//등록 
	public Notice insert(Notice NoticeVO);
	
	public void updateNo();
}
