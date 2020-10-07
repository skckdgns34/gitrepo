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

		List<Map<String,Object>> count = AudioBookDAO.getInstance().genreCount();
		ArrayList<Books> bestBooks = AudioBookDAO.getInstance().selectBestBooks(); //베스트북
		request.setAttribute("bestBooks", bestBooks);
		
		String gen = request.getParameter("gen");
		request.setAttribute("count", count);
		request.getRequestDispatcher("/ebook/audioBookCategory.jsp").forward(request, response);
	
	}

}
