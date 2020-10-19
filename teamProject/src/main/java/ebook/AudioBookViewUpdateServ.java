package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class AudioBookViewUpdateServ implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String views = request.getParameter("views");
		String book_no = request.getParameter("book_no");
		AudioBookDAO.getInstance().updateViews(book_no);
	}

}
