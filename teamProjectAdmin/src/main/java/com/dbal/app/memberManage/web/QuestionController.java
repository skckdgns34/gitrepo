package com.dbal.app.memberManage.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dbal.app.empManage.Employees;
import com.dbal.app.empManage.service.EmpService;
import com.dbal.app.memberManage.Answer;
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
	
	
	//답글달기
	@RequestMapping(value="/memberManageAnswer.ad", method = RequestMethod.GET)
	public String answerForm(Questions questions ,Model model, HttpServletRequest request) {
		String question_no = request.getParameter("question_no");
		questions.setQuestion_no(question_no);
		
		model.addAttribute("login", request.getSession().getAttribute("login"));
	
		model.addAttribute("list", questionService.selectOne(questions));
	return "memberManage/memberManageAnswer";
	}
	
	//답글달기 처리
	@RequestMapping(value="/memberManageAnswerInsert.ad", method = RequestMethod.POST)
	public String answerInsert(Answer answer, Questions questions) {
		System.out.println(answer.toString());
		questionService.insert(answer);
		//questionService.updateStatus(questions);
		return "redirect:/memberManageQuestion.ad";
	}
	
}
