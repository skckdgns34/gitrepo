package ebook;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import main.MainDAO;

public class AudioBookSearchAfterServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		MainDAO dao = new MainDAO();
		String AutoResult = request.getParameter("search");
		
 		String writer = "writer";
		String book = "book";
		String company = "company";
		if(AutoResult.equals(book)){
			System.out.println("책임");
			List<Map<String, Object>> list =dao.searchBooksEqualTitle(AutoResult);
			request.setAttribute("list", list);
		}
		else if(AutoResult.equals(writer)) {
			System.out.println("저자임");
			List<Map<String, Object>> list =dao.searchBooksEqualWriter(AutoResult);
			request.setAttribute("list", list);
		}
		else if(AutoResult.equals(company)) {
			System.out.println("회사이름임");
			List<Map<String, Object>> list =dao.searchBooksEqualCompany(AutoResult);
			request.setAttribute("list", list);
		}
		
		request.getRequestDispatcher("/ebook/eBookSearchAfter.jsp").forward(request, response);
		
		System.out.println(AutoResult);

	}

}
