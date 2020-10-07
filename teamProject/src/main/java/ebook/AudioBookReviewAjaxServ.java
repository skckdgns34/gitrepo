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
		String nickname = request.getParameter("member_nickname");
		System.out.println("여기오긴왔음");
		System.out.println("북넘북넘"+book_no);
		System.out.println("멤넘멤넘"+member_no);
		System.out.println("콘콘텐츠"+contents);
		System.out.println("닉넴닉넴"+nickname);
		review.setBook_no(book_no);
		review.setMember_no(member_no);
		review.setContents(contents);
		int seqno = EBookDAO.getInstance().insertReview(review);
		
		review = new Review();
		review = EBookDAO.getInstance().selectReview(seqno);
		
		request.setAttribute("nickname", nickname);
		request.setAttribute("review", review);
		request.getRequestDispatcher("/ebook/eBookReview.jsp").forward(request, response);
	
	}

}
