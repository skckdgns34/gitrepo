package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import member.MemberDAO;
import vo.Books;
import vo.Mylibrary;

public class AudioBookReadingServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//book_no받아와서 해당책의 정보 뿌림
		//request.getParameter("book_no");
		ArrayList<Books> book_detail = EBookDAO.getInstance().detailBook("15");
		
		ArrayList<Mylibrary> mylib = MemberDAO.getinstance().mylibList("2");
		request.setAttribute("mylib", mylib);
		request.setAttribute("book", book_detail);
		request.getRequestDispatcher("/ebook/audioBookReading.jsp").forward(request, response);
		
	}

}
