package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Notice;

public class ClientNoticeSelectServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Notice notice = new Notice();
		
		String notice_no= request.getParameter("notice_no");

		
		NoticeDAO dao = new NoticeDAO();
		notice = dao.selectOne(notice_no);
		
		request.setAttribute("notice", notice);
		
		request.getRequestDispatcher("client/clientNoticeSelect.jsp").forward(request, response);
		
	}

}
