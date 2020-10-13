package com.dbal.app.memberManage.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.books.Books;
import com.dbal.app.memberManage.Member;
import com.dbal.app.memberManage.mapper.MemberManageDAO;
import com.dbal.app.memberManage.service.MemberManageService;

@Service

public class MemberManageServiceImpl implements MemberManageService{
	@Autowired MemberManageDAO memberManageDAO;

	@Override
	public List<Member> selectAll(Member memberVO) {
		return memberManageDAO.selectAll(memberVO);
	}

	@Override
	public Member selectOne(Member memberVO) {
		return memberManageDAO.selectOne(memberVO);
	}

	@Override
	public void delete(Member memberVO) {
	  memberManageDAO.delete(memberVO);
	}

	@Override
	public void update(Member memberVO) {
		memberManageDAO.update(memberVO);
	}

	@Override
	public void insert(Member memberVO) {
		memberManageDAO.insert(memberVO);
		//updateNO 넣어주기
	}

	@Override
	public List<HashMap<String, Object>> getGenderCnt() {
		return memberManageDAO.getGenderCnt();
	}

	@Override
	public List<HashMap<String, Object>> getTicketCnt() {
		return memberManageDAO.getTicketCnt();
	}

	@Override
	public List<Books> selectViews() {
		return memberManageDAO.selectViews();
	}

	//이용권 조회
	@Override
	public List<Member> selectTicket(Member memberVO) {
		return memberManageDAO.selectTicket(memberVO);
	}
	
	//리뷰 조회
	@Override
	public List<Member> selectReview(Member memberVO) {
		return memberManageDAO.selectReview(memberVO);
	}
	//나만의 도서 조회
	@Override
	public List<Member> selectMylib(Member memberVO) {
		return memberManageDAO.selectMylib(memberVO);
	}
	

}
