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
		
		String checkCode = EBookDAO.getInstance().checkTicket(member_no);
		int check = EBookDAO.getInstance().recCheck( book_no,member_no);
		ArrayList<Books> book = EBookDAO.getInstance().detailBook(book_no);
		int count = EBookDAO.getInstance().recCount(book_no);
		
		
		
		System.out.println(book_no+"책책책책책넘버");
		System.out.println(member_id);
		System.out.println(member_no+"멤버넘버 세션");
		System.out.println(member_login);
		System.out.println(checkCode +"체크코드"); //이용권체크
		System.out.println(check + "로그인하자마자 체크");
		System.out.println(check + "상세페이지넘어가기전 체크");
		
		
		
		
		request.setAttribute("count", count);
		request.setAttribute("book", book);
		request.setAttribute("checkCode", checkCode);
		request.setAttribute("check", check);
		request.setAttribute("member_id", member_id);
		request.setAttribute("member_no", member_no);
		request.getRequestDispatcher("/ebook/eBookDetail.jsp").forward(request, response);
	}

}
