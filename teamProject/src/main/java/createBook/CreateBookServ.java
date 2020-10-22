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
import vo.Mywriting;

public class CreateBookServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
	
		String member_no = (String)request.getSession().getAttribute("member_no");
		String my_title = request.getParameter("title");
		String intro= request.getParameter("intro");
		String summary = request.getParameter("summary");
		System.out.println(my_title);
		ArrayList<Common> genreList=  CommonDAO.getInstance().selectAllGenre();
		request.setAttribute("genreList", genreList);
		ArrayList<Mywriting> chapterList = CreateBookDAO.getInstance().selectAllChapter(member_no, my_title);
		
		request.setAttribute("title", my_title);
		request.setAttribute("chapterList", chapterList);
		request.getRequestDispatcher("/createBook/createBookWrite.jsp").forward(request, response);
	}

}
