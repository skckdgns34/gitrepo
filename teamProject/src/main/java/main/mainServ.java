package main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class mainServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		ArrayList<Books> bookList = new ArrayList<Books>();
		
		
		
		request.setAttribute("bookList", bookList);
		request.getRequestDispatcher("/main/main.jsp").forward(request, response);
	}

}
