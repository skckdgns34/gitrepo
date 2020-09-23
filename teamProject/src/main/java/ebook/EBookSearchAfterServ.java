package ebook;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import main.MainDAO;

public class EBookSearchAfterServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		response.setContentType("text/html; charset=UTF-8");
		MainDAO dao = new MainDAO();
		String AutoResult = request.getParameter("hidden");
		String AutoSearchResult = request.getParameter("realHidden");
		System.out.println(AutoResult+"오토변수값");
		System.out.println(AutoSearchResult+"검색값");
 		String writer = "writer";
		String book = "book";
		String company = "company";
		if(AutoResult.equals(book)){
			System.out.println("책임");
			List<Map<String, Object>> list = dao.searchBooksEqualTitle(AutoSearchResult);
			request.setAttribute("list", list);
			System.out.println(list+"책");
		}
		else if(AutoResult.equals(writer)) {
			System.out.println("저자임");
			List<Map<String, Object>> list = dao.searchBooksEqualWriter(AutoSearchResult);
			request.setAttribute("list", list);
			System.out.println(list+"저자");
		}
		else if(AutoResult.equals(company)) {
			System.out.println("회사이름임");
			List<Map<String, Object>> list = dao.searchBooksEqualCompany(AutoSearchResult);
			request.setAttribute("list", list);
			System.out.println(list+"회사");
		}
		
		request.getRequestDispatcher("/ebook/eBookSearchAfter.jsp").forward(request, response);

	}

}
