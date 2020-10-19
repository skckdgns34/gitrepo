package com.dbal.app.memberManage.service;

import java.util.List;

import com.dbal.app.memberManage.Blacklist;
import com.dbal.app.memberManage.Report;

public interface ReportService {
	// 전체 조회
	public List<Report> selectAll(Report report);

	// 한 건 조회
	public Report selectOne(Report report);

	// 번호 업데이트
	public void updateNo();

	// 블랙 리스트 등록
	public void insert(Report report);

	//삭제
	public void delete(Report report);
	// 멤버 한명 조회
		public Report selectMem(Report report);
}
