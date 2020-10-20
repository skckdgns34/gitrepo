package main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import ebook.AudioBookDAO;
import vo.Mylibrary;

public class MainWishServ implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("book_no");
		String id = (String)request.getSession().getAttribute("member_no");
		Mylibrary wish = new Mylibrary();
		wish.setBook_no(no);
		wish.setMember_no(id);
		AudioBookDAO.getInstance().insertMylib(wish);
	}
}
