package com.dbal.app.memberManage.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.memberManage.Hopebooks;
import com.dbal.app.memberManage.service.HopebooksListService;

@Controller
public class HopebookskListController {
	@Autowired
	HopebooksListService hopebooksService;
	
	//전체조회
	@RequestMapping("/memberManageBlackList.ad")
	public String blackListAll(Model model, Hopebooks hopebooks) {
		model.addAttribute("list", hopebooksService.selectAll(hopebooks));
		return "memberManage/memberHopebooksList";
		
	}
}
