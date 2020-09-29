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
		String search_text = request.getParameter("search_text");
		String search_type = request.getParameter("search_type");
		List<Blacklist> list = BlacklistDAO.getinstance().selectAll(search_text, search_type);
		
		request.setAttribute("list", list);
		request.setAttribute("search_type", search_type);
		request.setAttribute("search_text", search_text);
	//	if(list.size() <= 0)request.setAttribute("message", "<tr><th colspan=13>검색결과가 없습니다.</th></tr>");
		request.getRequestDispatcher("/memberManage/memberManageBlackList.jsp").forward(request, response); //post로 보낼 때
	}

}
