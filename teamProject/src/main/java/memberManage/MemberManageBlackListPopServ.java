package memberManage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Blacklist;
import vo.Member;

public class MemberManageBlackListPopServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("회원 등록 / 수정");
		String blacklist_no =request.getParameter("blacklist_no");
		String blacklist_reason = request.getParameter("blacklist_reason");
		String member_no = request.getParameter("member_no");
		String limit_date = request.getParameter("limit_date");
		
		Blacklist black = new Blacklist();
		
		black.setBlacklist_no(blacklist_no);
		black.setBlacklist_reason(blacklist_reason);
		black.setMember_no(member_no);
		black.setLimit_date(limit_date);
		BlacklistDAO.getinstance().update(black);
		List<Blacklist> list = BlacklistDAO.getinstance().selectAll(null,null);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/memberManage/memberManageBlackList.jsp").forward(request, response);

	}

}
