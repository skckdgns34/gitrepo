package ebook;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
		request.setAttribute("member_no", member_no);
		request.setAttribute("book_no", book_no);		
		List<Map<String, Object>> checkMy = null;
		checkMy = EBookDAO.getInstance().myLibraryInsertAfterCheck(member_no, book_no);
		
		if(checkMy.size() == 0) {
			EBookDAO.getInstance().myLibraryFirstInsert(member_no,book_no);
			request.getRequestDispatcher("/ebook/eBookViewer.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/ebook/eBookViewer.jsp#"+ checkMy.get(0).get("last_read_index")).forward(request, response);
		}
	}

}
