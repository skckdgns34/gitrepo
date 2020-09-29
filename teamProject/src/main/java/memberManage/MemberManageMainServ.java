package memberManage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Member;

public class MemberManageMainServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		String search_text = request.getParameter("search_text");
		String search_type = request.getParameter("search_type");
		List<Member> list = MemberManageDAO.getinstance().selectAll(null);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/memberManage/memberManageMain.jsp").forward(request, response);; //post로 보낼 때
	}

	
}
