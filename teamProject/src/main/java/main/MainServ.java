package main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import ebook.CommonDAO;
import vo.Books;
import vo.Common;

public class MainServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		ArrayList<Common> genreList = CommonDAO.getInstance().selectAllGenre();
		
		ArrayList<Books> bookList = new ArrayList<Books>();
		bookList = MainDAO.getInstance().selectAllBook();
		
		request.setAttribute("bookList", bookList);
		request.setAttribute("genreList", genreList);
		request.getRequestDispatcher("/main/main.jsp").forward(request, response);
	}
}
