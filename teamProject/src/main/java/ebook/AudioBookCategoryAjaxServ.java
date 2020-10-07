package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class AudioBookCategoryAjaxServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String gen = request.getParameter("gen");
		
		ArrayList<Books> books=null;
		System.out.println(gen);
		
		if(gen == null || gen.equals("")) {
			books = EBookDAO.getInstance().raidoAllBooks();
		}
		else if(gen != null) {
			books = EBookDAO.getInstance().radioCheckGenre(gen);
		}
		//System.out.println("북스북스"+books);

		
		request.setAttribute("books", books);
		request.getRequestDispatcher("/ebook/audioBookCategoryBooks.jsp").forward(request, response);
		
		
	}

}
