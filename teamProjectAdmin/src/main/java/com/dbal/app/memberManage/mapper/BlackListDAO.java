package com.dbal.app.memberManage.mapper;

import java.util.List;

import com.dbal.app.memberManage.Blacklist;


public interface BlackListDAO {
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
}
