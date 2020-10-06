package com.dbal.app.memberManage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dbal.app.memberManage.Notice;

public interface NoticeService  {

	//전체 조회
	public List<Notice> selectAll(Notice noticeVO);
	//등록 
	public Notice insert(Notice NoticeVO);
}
