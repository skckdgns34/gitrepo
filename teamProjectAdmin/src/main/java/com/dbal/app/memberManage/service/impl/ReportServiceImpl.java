package com.dbal.app.memberManage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.memberManage.Blacklist;
import com.dbal.app.memberManage.Report;
import com.dbal.app.memberManage.mapper.BlackListDAO;
import com.dbal.app.memberManage.mapper.ReportDAO;
import com.dbal.app.memberManage.service.BlackListService;
import com.dbal.app.memberManage.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService  {
	@Autowired ReportDAO reportDAO;

	@Override
	public List<Report> selectAll(Report report) {
		return reportDAO.selectAll(report);
	}

	@Override
	public Report selectOne(Report report) {
		return reportDAO.selectOne(report);
	}

	@Override
	public void insert(Report report) {
		reportDAO.insert(report);
	}
	
	
}
