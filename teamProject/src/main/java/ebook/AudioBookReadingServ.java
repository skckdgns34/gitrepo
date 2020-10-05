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
		String book_no = request.getParameter("book_no");
		ArrayList<Books> book_detail = EBookDAO.getInstance().detailBook(book_no);
		
		//session에서 member_no 읽어와서 해당유저 mylibrary읽어오기.
		String no = (String) request.getSession().getAttribute("member_no");
		ArrayList<Mylibrary> mylib = MemberDAO.getinstance().mylibList(no);
		
		request.setAttribute("mylib", mylib);
		request.setAttribute("book", book_detail);
		request.getRequestDispatcher("/ebook/audioBookReading.jsp").forward(request, response);
	}
}
