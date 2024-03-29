package com.dbal.app.memberManage.service;

import java.util.List;

import com.dbal.app.memberManage.Blacklist;

public interface BlackListService {
			// 전체조회
			public List<Blacklist> selectAllList(Blacklist blacklist);
			// 단건조회
			public Blacklist selectOne(Blacklist black);
			//삭제
			public void delete(Blacklist black);
			//수정
			public void update(Blacklist black);
			//입력
			public void insert(Blacklist black);
			//번호 업데이트
			public void updateNo();
	}


