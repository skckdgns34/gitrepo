package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class AudioBookDetailServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		String book_no =  request.getParameter("book_no");
//		Member member_login = (Member)request.getSession().getAttribute("memberLogin");
		String member_id = (String)request.getSession().getAttribute("member_id");
		String member_no = (String)request.getSession().getAttribute("member_no");
		String member_nickname = (String)request.getSession().getAttribute("nickname");
		
		String checkCode = AudioBookDAO.getInstance().checkTicket(member_no); //체크코드 이용권 있는지 없는지
		int check = AudioBookDAO.getInstance().recCheck( book_no,member_no); // 좋아요 싫어요 했는지 안햇는지 체크
		ArrayList<Books> book = EBookDAO.getInstance().detailBook(book_no); //책의 상세내용
		int count = EBookDAO.getInstance().recCount(book_no); //조회수
		
		request.setAttribute("member_nickname", member_nickname);
		request.setAttribute("count", count);
		request.setAttribute("book", book);
		request.setAttribute("checkCode", checkCode);
		request.setAttribute("check", check);
		request.setAttribute("member_id", member_id);
		request.setAttribute("member_no", member_no);
		request.getRequestDispatcher("/ebook/audioBookDetail.jsp").forward(request, response);
	}

}
