package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class EBookDetailServ implements Controller
{

	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String no = request.getParameter("book_no");
		System.out.println(no);
		
		
		
		request.getRequestDispatcher("/ebook/eBookDetail.jsp").forward(request, response);
	}

}
