package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Review;

public class AudioBookReviewAjaxServ implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Review review = new Review();
		String member_no = request.getParameter("member_no");
		String contents = request.getParameter("review");
		String book_no = request.getParameter("book_no");
		
		review.setBook_no(book_no);
		review.setMember_no(member_no);
		review.setContents(contents);
		EBookDAO.getInstance().insertReview(review);
		
	}
}
