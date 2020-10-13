package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import member.MemberDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import vo.Bookmark;

public class AudioBookMarkInsertServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Bookmark mark = new Bookmark();
		String member_no = (String)request.getSession().getAttribute("member_no");
		String book_no = request.getParameter("book_no");
		String contents = request.getParameter("markcontents");
		String index = request.getParameter("markIndex");
		mark.setBook_no(book_no);
		mark.setMember_no(member_no);
		mark.setBookmark_index(index);
		mark.setBookmark_contents(contents);
		
		mark = MemberDAO.getinstance().insertBookMark(mark);
		response.getWriter().print(JSONArray.fromObject(mark)); 
	}
}
