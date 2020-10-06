package com.dbal.app.memberManage.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dbal.app.memberManage.Notice;
import com.dbal.app.memberManage.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService noticeService;

	// 전체조회
	@RequestMapping("/memberManageNotice.ad")

	public String noticeList(Model model, Notice noticeVO) {
		model.addAttribute("list",noticeService.selectAll(noticeVO));
	
		return "/memberManage/memberManageNotice";

	}

	// 등록 페이지
	@RequestMapping(value = "/memberManageNoticeInsert.ad", method = RequestMethod.GET)
	public String noticeInsertForm() {
		return "memberManage/noticeInsert";
	}
	//등록처리
	@RequestMapping(value = "/memberManageNoticeInsert.ad", method = RequestMethod.POST)
	public String noticeInsert(Notice notice) {
		noticeService.insert(notice);
		return "redirect:/memberManageNotice.ad";
		
	}
}
