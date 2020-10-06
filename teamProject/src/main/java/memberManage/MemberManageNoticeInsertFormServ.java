package memberManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import client.NoticeDAO;
import common.Controller;
import empManage.EmpDAO;
import vo.Employees;
import vo.Notice;

public class MemberManageNoticeInsertFormServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("/memberManage/memberManageNoticeInsert.jsp").forward(request, response);

	}

}
