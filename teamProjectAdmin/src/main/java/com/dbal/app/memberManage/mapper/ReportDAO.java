package com.dbal.app.memberManage.mapper;

import java.util.List;

import com.dbal.app.memberManage.Report;

public interface ReportDAO {
	//전체 조회
	public List<Report> selectAll(Report report);
	
	//한 건 조회
	public Report selectOne(Report report);
	
	//블랙 리스트 등록
	public void insert(Report report);

}
