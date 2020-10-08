package createBook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import ebook.CommonDAO;
import vo.Books;
import vo.Common;

public class CreateBookMainServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		
		//장르 목록
		String genre = request.getParameter("genre");
		ArrayList<Common> genreList=  CommonDAO.getInstance().selectAllGenre();
		
		//모든 유저들 책
		ArrayList<Books> userBooks = CreateBookDAO.getInstance().selectAllUserBook(genre);
		
		//유저들 책 rank
		ArrayList<Books> userBookRank = CreateBookDAO.getInstance().userBookRankList();
		
		//login
		String member_no = (String)request.getSession().getAttribute("member_no");
		
		request.setAttribute("genreList", genreList);
		request.setAttribute("userBooks", userBooks);
		request.setAttribute("userBookRank", userBookRank);
		request.getRequestDispatcher("/createBook/createBookMain.jsp").forward(request, response);
	}

}
