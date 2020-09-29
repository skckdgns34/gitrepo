package ebook;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class EBookDetailServ implements Controller
{

	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		String no = request.getParameter("book_no");
		System.out.println(no+"책책책책책넘버");
		Object member_id = request.getSession().getAttribute("member_id");
		Object member_no = request.getSession().getAttribute("member_no");
		Object member_login = request.getSession().getAttribute("memberLogin");
		System.out.println(member_id);
		System.out.println(member_no+"멤버넘버 세션");
		System.out.println(member_login);
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("member_no", member_no);
		//책 상세내용불러온거
		ArrayList<Books> book = EBookDAO.getInstance().detailBook(no);
		request.setAttribute("book", book);
		//아이디 넣고 코드있는지 보는거
		String list = EBookDAO.getInstance().checkTicket(member_no);
		request.setAttribute("checkCode", list);
		System.out.println(list +"체크코드");
		
		
		request.getRequestDispatcher("/ebook/eBookDetail.jsp").forward(request, response);
	}

}
