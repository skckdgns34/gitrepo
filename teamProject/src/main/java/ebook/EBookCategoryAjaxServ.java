package ebook;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONObject;
import vo.Books;

public class EBookCategoryAjaxServ implements Controller
{

	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		String gen = request.getParameter("radio_gen");
		String all = request.getParameter("radio_all");
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<Books> books = new ArrayList<Books>();
		System.out.println(gen);
		
		if(all != null) {
		books = EBookDAO.getInstance().raidoAllBooks();
		}
		else if(gen != null) {
		books = EBookDAO.getInstance().radioCheckGenre(gen);
		}
		for(int i=0; i<books.size(); i++) {
			map.put("book_no",books.get(i).getBook_no());
			map.put("book_img", books.get(i).getBook_img());
			map.put("title", books.get(i).getTitle());
		}
		System.out.println(books.get(2).getTitle());
		response.getWriter().print(JSONObject.fromObject(map)); 
	}

}
