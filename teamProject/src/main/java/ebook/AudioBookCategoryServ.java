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
		int allBooksCount = 0 ;
		allBooksCount = EBookDAO.getInstance().allBooksCount();
		List<Map<String,Object>> count = AudioBookDAO.getInstance().genreCount(); //장르별 책갯수

		int allCount = 0;

		List<Map<String,Object>> genreName = AudioBookDAO.getInstance().genreName();

		ArrayList<Books> bestBooks = AudioBookDAO.getInstance().selectBestBooks(); //베스트북

		
		ArrayList<Map<String,Object>> countName = AudioBookDAO.getInstance().genreCountName(); //장르별 책갯수

		allCount = AudioBookDAO.getInstance().genreAllCount();

		//결과저장
		request.setAttribute("allBooksCount", allBooksCount);
		request.setAttribute("bestBooks", bestBooks);


		request.setAttribute("countName", countName);

		request.setAttribute("allCount", allCount);
		request.setAttribute("genreName", genreName);
		request.setAttribute("count", count);
		request.getRequestDispatcher("/ebook/audioBookCategory.jsp").forward(request, response);
	
	}

}
