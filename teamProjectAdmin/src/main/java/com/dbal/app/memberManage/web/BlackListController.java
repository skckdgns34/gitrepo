package com.dbal.app.memberManage.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
