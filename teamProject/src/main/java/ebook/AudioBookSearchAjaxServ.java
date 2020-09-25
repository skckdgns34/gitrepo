package ebook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import main.MainDAO;
import net.sf.json.JSONArray;
import vo.SearchBook;

public class AudioBookSearchAjaxServ implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		MainDAO dao = new MainDAO();
		String aa = request.getParameter("data");
		ArrayList<SearchBook> list = dao.searchBook(aa);
		
		String result = JSONArray.fromObject(list).toString();
		response.getWriter().print(result);

	}

}
