package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;
import vo.Member;

public class EBookDetailServ implements Controller
{

	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String book_no =  request.getParameter("book_no");
		Member member_login = (Member)request.getSession().getAttribute("memberLogin");
		String member_id = (String)request.getSession().getAttribute("member_id");
		String member_no = (String)request.getSession().getAttribute("member_no");
		
		String list = EBookDAO.getInstance().checkTicket(member_no);
		int check = EBookDAO.getInstance().recCheck(member_no, book_no);
		ArrayList<Books> book = EBookDAO.getInstance().detailBook(book_no);
		
		System.out.println(book_no+"책책책책책넘버");
		System.out.println(member_id);
		System.out.println(member_no+"멤버넘버 세션");
		System.out.println(member_login);
		System.out.println(list +"체크코드");
		
		
		
		
		
		
		request.setAttribute("book", book);
		request.setAttribute("checkCode", list);
		request.setAttribute("check", check);
		request.setAttribute("member_id", member_id);
		request.setAttribute("member_no", member_no);
		request.getRequestDispatcher("/ebook/eBookDetail.jsp").forward(request, response);
	}

}
