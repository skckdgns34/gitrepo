package memberManage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Blacklist;
import vo.Member;

public class MemberManageBlackListServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		
		List<Blacklist> list = BlacklistDAO.getinstance().selectAllList(null);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/memberManage/memberManageBlackList.jsp").forward(request, response); //post로 보낼 때
	}

}
