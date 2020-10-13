package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;
import vo.Mywriting;

public class MemberCreateBookCompServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberBookDAO dao = new MemberBookDAO();
		Books books = new Books();
		
		books.setMember_no((String)request.getSession().getAttribute("member_no"));
		books.setBook_no(request.getParameter("book_no"));
		
		
		ArrayList<Books> list = dao.MyBook(books);
		request.setAttribute("list", list);
		request.getRequestDispatcher("member/memberCreateBookComp.jsp").forward(request, response);
	}

}
