package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONObject;
import vo.Review;

public class EBookReviewAjaxServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Review review = new Review();
		String member_no = (String)request.getAttribute("member_no");
		//닉네임 멤버넘버 넣어서 가져와야함
		String contents = (String)request.getAttribute("review");
		String book_no = (String)request.getAttribute("book_no");
		
		review.setBook_no(book_no);
		review.setMember_no(member_no);
		review.setContents(contents);
		int seqno = EBookDAO.getInstance().insertReview(review);
		
		review = new Review();
		review = EBookDAO.getInstance().selectReview(seqno);
		
		response.getWriter().print(JSONObject.fromObject(review));
	}

}
