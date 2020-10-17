package com.dbal.app.memberManage.mapper;

import java.util.List;

import com.dbal.app.memberManage.Notice;
import com.dbal.app.memberManage.Questions;

public interface NoticeDAO {
	//전체 조회
	public List<Notice> selectAll(Notice noticeVO);
	//한건
	public Notice selectOne(Notice notice);
	//등록 
	public void insert(Notice NoticeVO);
	//번호 업데이트
	public void updateNo();
	//삭제
	public void delete(Notice NoticeVO);
	//수정
	public void update(Notice notice);

	
	
}
