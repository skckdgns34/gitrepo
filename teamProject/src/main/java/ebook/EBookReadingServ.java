package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class EBookReadingServ implements Controller
{

	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String book_no = request.getParameter("reading_book_no");
		String member_no =request.getParameter("reading_member_no");
		int insertMy =0;
		int checkMy = 0;
		checkMy = EBookDAO.getInstance().myLibraryInsertAfterCheck(member_no, book_no);
		if(checkMy == 0) {
			insertMy = EBookDAO.getInstance().myLibraryFirstInsert(member_no,book_no);
		}
		request.setAttribute("member_no", member_no);
		request.setAttribute(book_no, book_no);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		//response.sendRedirect("/epub/index.jsp");
	}

}
