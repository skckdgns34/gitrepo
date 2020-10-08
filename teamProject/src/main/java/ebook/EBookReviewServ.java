package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.Paging;
import vo.Books;
import vo.Review;

public class EBookReviewServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Paging paging = new Paging();
		paging.setPageUnit(10);
		//현재 페이지번호
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);

		//검색 파라미터
		int first = paging.getFirst();
		int last = paging.getLast();
		
		
		String book_no =  request.getParameter("book_no"); //책넘버
		int total = EBookDAO.getInstance().countReview(book_no);		
		paging.setTotalRecord(total);

		ArrayList<Review> review = EBookDAO.getInstance().selectAllReview(book_no,first,last); //리뷰전체보여주기
		request.setAttribute("paging", paging);
		request.setAttribute("review", review); //디테일 페이지 넘어가면서 리뷰 뿌려주기
		request.getRequestDispatcher("/ebook/eBookReview.jsp").forward(request, response);
	}

}
