package com.dbal.app.memberManage.service;

import java.util.HashMap;
import java.util.List;

import com.dbal.app.memberManage.Member;

public interface MemberManageService {
	// 전체조회
		public List<Member> selectAll(Member memberVO);

		// 단건조회
		public Member selectOne(Member memberVO);

		// 삭제
		public void delete(Member memberVO);

		// 수정
		public void update(Member memberVO);

		// 입력
		public void insert(Member memberVO);

		// 최다 조회수
		//public List<Books> selectViews();

		// 성별인원수 : select gender, count(id) cnt from member group by gender
		public List<HashMap<String, Object>> getGenderCnt();
		
		// 성별 인기 이용권
		public List<HashMap<String, Object>> getTicketCnt();
}
