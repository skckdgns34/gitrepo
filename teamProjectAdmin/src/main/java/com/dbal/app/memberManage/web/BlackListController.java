package com.dbal.app.memberManage.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dbal.app.memberManage.Blacklist;
import com.dbal.app.memberManage.service.BlackListService;

@Controller
public class BlackListController {
	@Autowired
	BlackListService blackListService;
	
	//전체조회
	@RequestMapping("/memberManageBlackList.ad")
	public String blackListAll(Model model, Blacklist blackList) {
		model.addAttribute("list", blackListService.selectAllList(blackList));
		return "memberManage/memberManageBlackList";
		
	}
	//수정페이지
	 @RequestMapping(value="/memberManageBlackListPopForm.ad", method = RequestMethod.GET)
	public String blackUpdateForm(Model model, Blacklist blacklist, HttpServletRequest request) {
		 String blacklist_no = request.getParameter("blacklist_no");
		 blacklist.setBlacklist_no(blacklist_no);
		 model.addAttribute("black", blackListService.selectOne(blacklist));
		 return "memberManage/memberManageBlackListPop";
		 
	 }
	 //수정 처리
	 @RequestMapping(value="/memberManageBlackListPop.ad", method = RequestMethod.POST)
	public String blackUpdate(Blacklist blacklist, HttpServletRequest request) {
		 blackListService.update(blacklist);
		 return "redirect:/memberManageBlackList.ad";
	 }
	
	 
	//삭제
	@RequestMapping(value="/memberManageBlackListDelete.ad", method = RequestMethod.GET)
	public String blackDelete(Blacklist black, HttpServletRequest request) {
		String blacklist_no = request.getParameter("blacklist_no");
		black.setBlacklist_no(blacklist_no);
		blackListService.delete(black);		
		return "redirect:/memberManageBlackList";
		
	}
}
