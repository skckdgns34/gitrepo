package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.Paging;
import vo.Books;

public class AudioBookCategoryAjaxServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		Paging paging = new Paging();
		paging.setPageUnit(12);
		//현재 페이지번호
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);
		
		//검색 파라미터
		int first = paging.getFirst();
		int last = paging.getLast();
				
		String gen = request.getParameter("gen");

		ArrayList<Books> books=null;
		System.out.println(gen);
		
		if(gen == null || gen.equals("")) {
			books = AudioBookDAO.getInstance().raidoAllBooks(first, last);
		}
		else if(gen != null) {
			books = AudioBookDAO.getInstance().radioCheckGenre(gen,first,last);
		}
		
		int total = AudioBookDAO.getInstance().count(gen);		
		paging.setTotalRecord(total);
		
		
		request.setAttribute("paging", paging);
		request.setAttribute("books", books);
		request.getRequestDispatcher("/ebook/audioBookCategoryBooks.jsp").forward(request, response);
		
		
	}

}
