package com.dbal.app.memberManage.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dbal.app.common.FileRenamePolicy;
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
	
		return "memberManage/memberManageNotice";

	}

	// 등록 페이지
	@RequestMapping(value = "/memberManageNoticeInsertForm.ad", method = RequestMethod.GET)
	public String noticeInsertForm() {
		return "memberManage/memberManageNoticeInsert";
	}
	//등록처리
	@RequestMapping(value = "/memberManageNoticeInsert.ad", method = RequestMethod.POST)
	public String noticeInsert(Notice notice, HttpServletRequest request) {
		noticeService.insert(notice);
		return "redirect:/memberManageNotice.ad";
		
	}
	
	//수정 페이지
	@RequestMapping(value="/memberManageNoticeModifyForm.ad",method = RequestMethod.GET)
	public String noticeModifyForm(Notice notice, Model model, HttpServletRequest request) {
		String notice_no = request.getParameter("notice_no");
		notice.setNotice_no(notice_no);
		model.addAttribute("notice", noticeService.selectOne(notice));
		return "memberManage/memberManageNoticeModify";
		
	}
	//수정 처리
	@RequestMapping(value="/memberManageNoticeModify.ad",method = RequestMethod.POST)
	public String noticeModify(Notice notice, HttpServletRequest request) throws IllegalStateException, IOException {
		 MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
	       //표지 업로드
	       MultipartFile imgFile = multipartRequest.getFile("notice_img1");
	      String path = "c:/전자도서관/책표지";
	      String fileName;
	      if(imgFile !=null && !imgFile.isEmpty() && imgFile.getSize()>0) {
	         fileName = imgFile.getOriginalFilename();
	         //파일명 중복체크
	         File renameFile = FileRenamePolicy.rename(new File(path, fileName));
	         imgFile.transferTo(new File(path,renameFile.getName()));
	         notice.setNotice_img(renameFile.getName());
	      }
	      

		noticeService.update(notice);
		return "redirect:/memberManageNotice.ad";
	}
	

	//삭제
	@RequestMapping(value="/memberManageNoticeDelete.ad", method = RequestMethod.GET)
	public String noticeDelete(Notice notice, HttpServletRequest request) {
		String notice_no = request.getParameter("notice_no");
		notice.setNotice_no(notice_no);
		noticeService.delete(notice);
		return "redirect:/memberManageNotice.ad";
	}
}
