package memberManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Employees;
import vo.Notice;

public class MemberManageNoticeInsertServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("공지사항 등록 ");
		 Notice notice = new Notice();
		 notice.setNotice_no(request.getParameter("notice_no"));
		 notice.setNotice_title(request.getParameter("notice_title"));
		 notice.setNotice_content(request.getParameter("notice_content"));
		 notice.setNotice_date(request.getParameter("notice_date"));
		 notice.setNotice_img(request.getParameter("notice_img"));
		 notice.setEmp_no(request.getParameter("emp_no"));
		 
		NoticeDAO dao = new NoticeDAO();
		dao.insert(notice);
		
		 request.getRequestDispatcher("/memberManageNotice.ad").forward(request, response);
		 
	}

}
