package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONArray;
import vo.SearchBook;

public class EBookSearchAjaxServ implements Controller {


	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		EBookDAO dao = new EBookDAO();
		String aa = request.getParameter("data");
		ArrayList<SearchBook> list = dao.searchBook(aa);
		
		String result = JSONArray.fromObject(list).toString();
		response.getWriter().print(result);

	}

}
