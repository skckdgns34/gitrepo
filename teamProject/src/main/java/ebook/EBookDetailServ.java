package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import common.Paging;
import empManage.EmpDAO;
import vo.Books;
import vo.Member;
import vo.Review;

public class EBookDetailServ implements Controller
{

	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		
		String m_book = request.getParameter("m_book");//회원들 글인지
		String book_no =  request.getParameter("book_no"); //책넘버
		//Member member_login = (Member)request.getSession().getAttribute("memberLogin");//멤버 로그인 정보
		String member_id = (String)request.getSession().getAttribute("member_id"); //멤버아이디
		String member_no = (String)request.getSession().getAttribute("member_no"); //멤버넘버
		String member_nickname = (String)request.getSession().getAttribute("nickname"); //멤버 닉네임
		
		
		
		String checkCode = EBookDAO.getInstance().checkTicket(member_no); //체크코드 이용권 있는지 없는지
		int check = EBookDAO.getInstance().recCheck( book_no,member_no); // 좋아요 싫어요 했는지 안햇는지 체크
		ArrayList<Books> book = EBookDAO.getInstance().detailBook(book_no); //책의 상세내용
		int count = EBookDAO.getInstance().recCount(book_no); //조회수
		String wish = EBookDAO.getInstance().wishYn(book_no, member_no);

		request.setAttribute("m_book", m_book);
		request.setAttribute("wish", wish);
		request.setAttribute("member_nickname", member_nickname);
		request.setAttribute("count", count);
		request.setAttribute("book", book);
		request.setAttribute("checkCode", checkCode);
		request.setAttribute("check", check);
		request.setAttribute("member_id", member_id);
		request.setAttribute("member_no", member_no);
		request.getRequestDispatcher("/ebook/eBookDetail.jsp").forward(request, response);
	}

}
