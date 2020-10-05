package ebook;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import main.MainDAO;
import vo.Books;
import vo.Common;

public class EBookCategoryServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//도서의 장르들을 불러오는 코드 필요(공통코드에서 도서장르의 내용들을 불러오는거.
		ArrayList<Common> list = new ArrayList<Common>();
		list = CommonDAO.getInstance().selectAllGenre();
		request.setAttribute("genreList", list);

		ArrayList<Books> books=null;

		List<Map<String,Object>> count = EBookDAO.getInstance().genreCount();
		
		
		String gen = request.getParameter("gen");
		
		System.out.println(gen);
//		books = EBookDAO.getInstance().raidoAllBooks();
		
		if(gen == "undefined") {
			books = EBookDAO.getInstance().raidoAllBooks();
		}
		else if(gen != null) {
			books = EBookDAO.getInstance().radioCheckGenre(gen);
		}
		
		
		
		
		request.setAttribute("count", count);
		request.setAttribute("books", books);
		request.getRequestDispatcher("/ebook/eBookCategory.jsp").forward(request, response);
		
	}
}
