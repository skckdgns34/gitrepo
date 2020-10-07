package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.Paging;
import vo.Review;

public class EBookReviewListAjaxServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String book_no = request.getParameter("book_no");
		String nickname = request.getParameter("member_nickname");
		
		
		Paging paging = new Paging();
		paging.setPageUnit(2);
		//현재 페이지번호
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);

		//검색 파라미터
		int first = paging.getFirst();
		int last = paging.getLast();
		int total = EBookDAO.getInstance().countReview(book_no);		
		paging.setTotalRecord(total);
		
		
		ArrayList<Review> review = EBookDAO.getInstance().selectAllReview(book_no, first, last);

		request.setAttribute("nickname", nickname);
		request.setAttribute("review", review);
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("/ebook/eBookReview.jsp").forward(request, response);
		
	}

}
