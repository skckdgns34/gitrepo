package ebook;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.Paging;
import empManage.EmpDAO;
import main.MainDAO;
import vo.Books;
import vo.Common;

public class EBookCategoryServ implements Controller
{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int allBooksCount = 0 ;
		allBooksCount = EBookDAO.getInstance().allBooksCount();
		List<Map<String,Object>> count = EBookDAO.getInstance().genreCount(); //장르별 책갯수
		ArrayList<Books> bestBooks = EBookDAO.getInstance().selectBestBooks(); //베스트북
		
		ArrayList<Map<String,Object>> countName = EBookDAO.getInstance().genreCountName(); //장르별 책갯수
		//결과저장
		request.setAttribute("allBooksCount", allBooksCount);
		request.setAttribute("bestBooks", bestBooks);

		request.setAttribute("countName", countName);
		request.setAttribute("count", count);
		request.getRequestDispatcher("/ebook/eBookCategory.jsp").forward(request, response);
	}
}
