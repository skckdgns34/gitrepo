package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class EBookReadingBookMarkDeleteAjaxServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_no = request.getParameter("member_no");
		String book_no = request.getParameter("book_no");
		String bookmark_index = request.getParameter("bookmark_index");
		
		EBookDAO.getInstance().eBookMarkDelete(member_no, book_no, bookmark_index);

	}

}
