package createBook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class CreateBookMainServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//모든 유저들 책
		ArrayList<Books> userBooks = CreateBookDAO.getInstance().selectAllUserBook();
		
		//유저들 책 rank
		ArrayList<Books> userBookRank = CreateBookDAO.getInstance().userBookRankList();
		request.setAttribute("userBooks", userBooks);
		request.setAttribute("userBookRank", userBookRank);
		request.getRequestDispatcher("/createBook/createBookMain.jsp").forward(request, response);
	}

}
