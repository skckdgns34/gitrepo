package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;
import vo.Mylibrary;

public class MemberBookMarkServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		MemberBookDAO dao = new MemberBookDAO();
		Mylibrary mylibraryVO = new Mylibrary();
		
		mylibraryVO.setMember_no((String)request.getSession().getAttribute("member_no"));
		mylibraryVO.setBook_no(request.getParameter("book_no"));
		
		ArrayList<Mylibrary> list = dao.reading(mylibraryVO);
		request.setAttribute("list", list);
		request.getRequestDispatcher("member/memberBookMark.jsp").forward(request, response);
	}

}
