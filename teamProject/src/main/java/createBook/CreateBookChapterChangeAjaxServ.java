package createBook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONObject;
import vo.Mywriting;

public class CreateBookChapterChangeAjaxServ implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String member_no = (String)request.getSession().getAttribute("member_no");
		String my_title = request.getParameter("my_title");
		String chapter = request.getParameter("chapter");

		Mywriting m_book = new Mywriting();
		m_book.setMember_no(member_no);
		m_book.setMy_title(my_title);
		m_book.setChapter(chapter);
		
		Mywriting m_bookDetail = CreateBookDAO.getInstance().myBookDetail(m_book);
		response.getWriter().print(JSONObject.fromObject(m_bookDetail)); 
	}

}
