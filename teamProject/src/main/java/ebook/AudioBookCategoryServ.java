package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;
import vo.Common;

public class AudioBookCategoryServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		ArrayList<Common> list = new ArrayList<Common>();
		list = CommonDAO.getInstance().selectAllGenre();
		request.setAttribute("genreList", list);

		ArrayList<Books> bookList = new ArrayList<Books>();   
		
		ArrayList<ArrayList<Books>> books = new ArrayList<ArrayList<Books>>();
		for(int i=0; i<list.size()-1; i++) {
			bookList = EbookDAO.getInstance().selectAllAudioBook(list.get(i).getCode());
			books.add(bookList);
			bookList = new ArrayList<Books>();
		}
		request.setAttribute("books", books);
		System.out.println("히히");
		request.getRequestDispatcher("/ebook/audioBookCategory.jsp").forward(request, response);

	
	}

}
