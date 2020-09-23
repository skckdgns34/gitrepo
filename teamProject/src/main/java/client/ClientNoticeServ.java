package client;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Notice;

public class ClientNoticeServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		NoticeDAO dao = new NoticeDAO();
		ArrayList<Notice> list = dao.selectAll(null);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("client/clientNotice.jsp").forward(request, response);
		
	}

}
