package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class AudioBookCategoryServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		ArrayList<Books> bookList = new ArrayList<Books>();
		bookList = EbookDAO.getInstance().selectAllAudioBook();
		
		request.setAttribute("bookList", bookList);
		request.getRequestDispatcher("/ebook/audioBookCategory.jsp").forward(request, response);
	}

}
