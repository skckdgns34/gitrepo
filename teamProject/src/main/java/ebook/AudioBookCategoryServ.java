package ebook;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;
import vo.Common;

public class AudioBookCategoryServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		ArrayList<Common> list = new ArrayList<Common>();
		list = CommonDAO.getInstance().selectAllGenre();
		request.setAttribute("genreList", list);

		ArrayList<Books> books=null;
		
		List<Map<String,Object>> count = EBookDAO.getInstance().genreCount();

		String gen = request.getParameter("gen");

		if(gen == "undefined") {
			books = EBookDAO.getInstance().raidoAllBooks();
		}
		else if(gen != null) {
			books = EBookDAO.getInstance().radioCheckGenre(gen);
		}
		request.setAttribute("count", count);
		request.setAttribute("books", books);
		request.getRequestDispatcher("/ebook/audioBookCategory.jsp").forward(request, response);
	
	}

}
