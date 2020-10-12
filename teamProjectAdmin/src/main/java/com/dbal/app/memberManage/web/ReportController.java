package com.dbal.app.memberManage.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dbal.app.memberManage.Blacklist;
import com.dbal.app.memberManage.Report;
import com.dbal.app.memberManage.service.BlackListService;
import com.dbal.app.memberManage.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	ReportService reportService;
	
	//전체조회
	@RequestMapping("/memberManageReportList.ad")
	public String reportAll(Model model, Report report) {
		model.addAttribute("list", reportService.selectAll(report));
		return "memberManage/memberManageReportList";
		
	}
	//수정페이지
	 @RequestMapping(value="/memberManageReportModifyForm.ad", method = RequestMethod.GET)
	public String reportUpdateForm(Model model, Report report, HttpServletRequest request) {
		
		 return null;
		 
	 }
	 //수정 처리
	 @RequestMapping(value="/memberManageReportModify.ad", method = RequestMethod.POST)
	public String reportUpdate(Report report, HttpServletRequest request) {
		
		 return null;
	 }
	
	 
	/*
	@RequestMapping(value="/memberManageBlackListDelete.ad", method = RequestMethod.GET)
	public String blackDelete(Report report, HttpServletRequest request) {
		
		return "redirect:/memberManageBlackList.ad";
		
	} */
}
