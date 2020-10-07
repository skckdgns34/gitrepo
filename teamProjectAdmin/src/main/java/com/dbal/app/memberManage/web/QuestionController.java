package com.dbal.app.memberManage.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.memberManage.Questions;
import com.dbal.app.memberManage.service.QuestionService;

@Controller

public class QuestionController {
	@Autowired
	QuestionService questionService;
	
	//전체조회
	@RequestMapping("/memberManageQuestion.ad")
	
	public String questionList(Model model, Questions questions) {
		model.addAttribute("list", questionService.selectAll(questions));
		
		return "memberManage/memberManageQuestion";
	}
	
}
