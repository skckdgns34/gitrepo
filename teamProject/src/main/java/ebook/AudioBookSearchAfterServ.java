package ebook;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class AudioBookSearchAfterServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		AudioBookDAO dao = new AudioBookDAO();
		String AutoResult = request.getParameter("hidden");
		String AutoSearchResult = request.getParameter("realHidden");
		
 		String writer = "writer";
		String book = "book";
		String company = "company";
		if(AutoResult.equals(book)){
			System.out.println("오디오책임");
			List<Map<String, Object>> list =dao.searchBooksEqualTitle(AutoSearchResult);
			request.setAttribute("list", list);
		}
		else if(AutoResult.equals(writer)) {
			System.out.println("오디오저자임");
			List<Map<String, Object>> list =dao.searchBooksEqualWriter(AutoSearchResult);
			request.setAttribute("list", list);
		}
		else if(AutoResult.equals(company)) {
			System.out.println("오디오회사이름임");
			List<Map<String, Object>> list =dao.searchBooksEqualCompany(AutoSearchResult);
			request.setAttribute("list", list);
		}
		
		request.getRequestDispatcher("/ebook/audioBookSearchAfter.jsp").forward(request, response);
		
		System.out.println(AutoResult  + " 오디오??");

	}

}
