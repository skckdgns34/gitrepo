package ebook;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import vo.Books;

public class EBookCategoryAjaxServ implements Controller
{

	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		
		
		String gen = request.getParameter("gen");
		
		ArrayList<Books> books=null;
		System.out.println(gen);
		
		if(gen == null || gen.equals("")) {
			books = EBookDAO.getInstance().raidoAllBooks();
		}
		else if(gen != null) {
			books = EBookDAO.getInstance().radioCheckGenre(gen);
		}
		//System.out.println("북스북스"+books);

		
		request.setAttribute("books", books);
		request.getRequestDispatcher("/ebook/eBookCategoryBooks.jsp").forward(request, response);
		
	
		//System.out.println(books.get(2).getTitle());
		
		//response.getWriter().print(JSONArray.fromObject(books)); 
	}

}
