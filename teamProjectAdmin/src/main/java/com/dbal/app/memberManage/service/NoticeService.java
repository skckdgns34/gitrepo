package com.dbal.app.memberManage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dbal.app.memberManage.Notice;

public interface NoticeService  {

	//전체 조회
	public List<Notice> selectAll(Notice noticeVO);
	
	//한 건 조회
	public Notice selectOne(Notice notice);

	//등록 
	public void insert(Notice NoticeVO);
	//삭제
	public void delete(Notice noticeVO);
	
	//수정
	public void update(Notice notice);
}
