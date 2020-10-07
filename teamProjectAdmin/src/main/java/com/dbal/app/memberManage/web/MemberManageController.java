package com.dbal.app.memberManage.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dbal.app.books.Books;
import com.dbal.app.memberManage.Member;
import com.dbal.app.memberManage.service.MemberManageService;


@Controller
public class MemberManageController {
	@Autowired
	MemberManageService memberManageService;

	// 전체조회
	@RequestMapping("/memberManageMain.ad")
	public String blackListAll(Model model, Member member) {
		model.addAttribute("list", memberManageService.selectAll(member));
		return "memberManage/memberManageMain";
	}
	
	//수정 페이지
	@RequestMapping(value="/memberManageModifyForm.ad",method = RequestMethod.GET)
	public String memberManageInsertForm(Member memberVO, Model model, HttpServletRequest request) {
		String member_no = request.getParameter("member_no");
		memberVO.setMember_no(member_no);
		model.addAttribute("member", memberManageService.selectOne(memberVO));
		return "memberManage/memberManageModify";
	}
	//수정 처리
	@RequestMapping(value = "/memberManageModify.ad", method = RequestMethod.POST)
	public String memberManageInsert(Member memberVO) {
		memberManageService.update(memberVO);
		return "redirect:/memberManageMain.ad";
	}
	
	@RequestMapping(value="/memberManageDelete.ad", method = RequestMethod.GET)
	public String memberManageDelete(Member memberVO, HttpServletRequest request ) {
		String member_no = request.getParameter("member_no");
		memberVO.setMember_no(member_no);
		memberManageService.delete(memberVO);
		return "redirect:/memberManageMain.ad"; 
	}
	
	
	//그래프1
	@RequestMapping(value="/viewChart.ad" )
	@ResponseBody
	public List<Books> viewChart(Books book) {
		return memberManageService.selectViews();
	}
	// 그래프2
	@RequestMapping(value="/genderChart.ad" )
	@ResponseBody
	public List<HashMap<String, Object>> getGenderCnt(){
		return memberManageService.getGenderCnt();
	}
	// 그래프3
	@RequestMapping(value="/ticketChart.ad")
	@ResponseBody
	public List<HashMap<String, Object>> getTicketCnt(){
		return memberManageService.getTicketCnt();
	}
	
}
