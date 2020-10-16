package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class eBookViewerBookMarkUpdateAjaxServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_no = request.getParameter("member_no");
		String book_no = request.getParameter("book_no");
		String book_index = request.getParameter("book_index");
		
		EBookDAO.getInstance().bookMarkUpdate(member_no, book_no, book_index);

	}

}
