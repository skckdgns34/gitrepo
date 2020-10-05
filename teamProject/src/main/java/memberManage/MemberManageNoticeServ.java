package memberManage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Notice;

public class MemberManageNoticeServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			List<Notice> list = memberManage.NoticeDAO.getinstance().selectAll(null);
			request.setAttribute("list", list);
			System.out.println(list);
			request.getRequestDispatcher("/memberManage/memberManageNotice.jsp").forward(request, response);
	}

}
