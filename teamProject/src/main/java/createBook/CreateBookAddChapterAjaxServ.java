package createBook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONObject;

public class CreateBookAddChapterAjaxServ implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_no = (String)request.getSession().getAttribute("member_no");
		String my_title = request.getParameter("my_title");
		
		int r = CreateBookDAO.getInstance().myBookMaxChapter(member_no, my_title);
		System.out.println(r+"맥스값");
		response.getWriter().print(r); 

	}

}
