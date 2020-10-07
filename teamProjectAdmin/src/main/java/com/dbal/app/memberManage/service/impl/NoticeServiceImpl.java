package com.dbal.app.memberManage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.memberManage.Notice;
import com.dbal.app.memberManage.mapper.NoticeDAO;
import com.dbal.app.memberManage.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired NoticeDAO noticeDAO;
	
	@Override
	public List<Notice> selectAll(Notice noticeVO) {
		return noticeDAO.selectAll(noticeVO);
	}

	@Override
	public Notice insert(Notice NoticeVO) {
		return noticeDAO.insert(NoticeVO);
	}

}
