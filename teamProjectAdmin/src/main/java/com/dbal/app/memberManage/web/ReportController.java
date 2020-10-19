package com.dbal.app.memberManage.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//리뷰에 해당하는 내용 조회
	 @RequestMapping(value = "/reportSelect.ad")
	 @ResponseBody
	 public Report reportSelect(Model model, Report report, HttpServletRequest request) {
		 String review_no = request.getParameter("review_no");
		 report.setReview_no(review_no);
		 
		 return reportService.selectOne(report);
	 }
	//블랙리스트 등록
	 @RequestMapping(value="/memberManageReportModifyForm.ad", method = RequestMethod.GET)
	public String reportUpdateForm(Report report, Model model,HttpServletRequest request ) {
	
		 reportService.insert(report);
		 
		 return "redirect:/memberManageBlackList.ad";
	 }
	//신고 삭제
	@RequestMapping(value="/memberManageReportDelete.ad", method = RequestMethod.GET)
	public String blackDelete(Report report, HttpServletRequest request) {
		reportService.delete(report);
		return "redirect:/memberManageReportList.ad";
		
	} 
}
