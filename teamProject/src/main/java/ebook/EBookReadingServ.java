package ebook;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONArray;

public class EBookReadingServ implements Controller
{

	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String book_no = request.getParameter("reading_book_no");
		String member_no = (String)request.getSession().getAttribute("member_no");
		
		
		List<Map<String, Object>> list = EBookDAO.getInstance().selectBookMark(member_no, book_no);
		System.out.println(list + "리스트임");
		if(book_no != null && ! book_no.equals("")){			
			request.getSession().setAttribute("book_no", book_no);
		} else {
			book_no = (String)request.getSession().getAttribute("book_no");
		}
		String epub_path = EBookDAO.getInstance().selectEpubPath(book_no);
		
		EBookDAO.getInstance().updateViews(book_no);
		request.setAttribute("epub_path", epub_path);
		request.setAttribute("book_no", book_no);
		request.setAttribute("member_no", member_no);
		request.setAttribute("list", JSONArray.fromObject(list).toString());
		
		
		List<Map<String, Object>> checkMy = null;
		checkMy = EBookDAO.getInstance().myLibraryInsertAfterCheck(member_no, book_no);
		
		if(checkMy.size() == 0) {
			EBookDAO.getInstance().myLibraryFirstInsert(member_no,book_no);
			request.getRequestDispatcher("/ebook/eBookViewer.jsp").forward(request, response);
		}else {
			request.setAttribute("last_index", checkMy.get(0).get("last_read_index"));
			request.getRequestDispatcher("/ebook/eBookViewer.jsp").forward(request, response);
		}
	}

}
