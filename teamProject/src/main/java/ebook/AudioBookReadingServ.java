package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import member.MemberDAO;
import vo.Bookmark;
import vo.Books;
import vo.Mylibrary;

public class AudioBookReadingServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{

		//책 읽기 눌렀을 때 mylibrary에 추가하는데 일단 조회해서 있는지 보고 없으면 그때 넣을꺼.
		Mylibrary my = new Mylibrary();
		String book_no = request.getParameter("book_no");
		String no = (String) request.getSession().getAttribute("member_no");
		my.setBook_no(book_no);
		my.setMember_no(no);
		int r = AudioBookDAO.getInstance().myBookyn(my);
		
		if(r==0){
			AudioBookDAO.getInstance().insertMylib(my);
		}
		ArrayList<Bookmark> markList = MemberDAO.getinstance().bookMarkList(book_no, no);
		
		//book_no받아와서 해당책의 정보 뿌림
		ArrayList<Books> book_detail = EBookDAO.getInstance().detailBook(book_no);
		
		//session에서 member_no 읽어와서 해당유저 mylibrary읽어오기.
		ArrayList<Mylibrary> mylib = MemberDAO.getinstance().mylibList(no);
		
		
		//현재 책의 현재 접속자의 last_read_index
		int index = MemberDAO.getinstance().myBookIndex(book_no, no);
		request.setAttribute("book_index", index);
		request.setAttribute("mylib", mylib);
		request.setAttribute("book", book_detail);
		request.setAttribute("markList", markList);
		request.getRequestDispatcher("/ebook/audioBookReading.jsp").forward(request, response);
	}
}
