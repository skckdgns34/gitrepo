package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class AudioBookReviewUpdateAjaxServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String review_no = (String) request.getParameter("review_no");
		String contents = (String) request.getParameter("contents");
		

		
		System.out.println(review_no+"컨트롤러에서 리뷰넘버임");
		EBookDAO.getInstance().reviewUpdate(contents, review_no);
	
	}

}
