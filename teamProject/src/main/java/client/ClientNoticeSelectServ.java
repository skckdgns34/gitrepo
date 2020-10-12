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
		
		notice.setNotice_no((String)request.getSession().getAttribute("notice_no"));
		notice.setNotice_title((String)request.getSession().getAttribute("notice_title"));
		notice.setNotice_date((String)request.getSession().getAttribute("notice_date"));
		notice.setNotice_content((String)request.getSession().getAttribute("notice_content"));
		
//		notice.setNotice_no(request.getParameter("notice_no"));
//		notice.setNotice_title(request.getParameter("notice_title"));
//		notice.setNotice_date(request.getParameter("notice_date"));
//		notice.setNotice_content(request.getParameter("notice_content"));
		
		NoticeDAO dao = new NoticeDAO();
		dao.selectOne(notice);
		
		request.getRequestDispatcher("client/clientNoticeSelect.jsp").forward(request, response);
		
	}

}
