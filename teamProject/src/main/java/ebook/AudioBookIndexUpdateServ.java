package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import member.MemberDAO;
import vo.Mylibrary;

public class AudioBookIndexUpdateServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String index = request.getParameter("index");
		String book_no = request.getParameter("book_no");
		String member_no = (String) request.getSession().getAttribute("member_no");
		
		MemberDAO.getinstance().updateIndex(index, member_no, book_no);
		
		
	}

}
