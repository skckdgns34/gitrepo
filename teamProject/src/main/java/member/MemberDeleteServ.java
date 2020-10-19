package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import vo.Member;

public class MemberDeleteServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		
		HttpSession session = request.getSession();
		
		Member memberVO = new Member();
		memberVO.setMember_id(request.getParameter("member_id"));
		
		MemberDAO dao = new MemberDAO();
		dao.delete(memberVO);
		
		session.invalidate();
		
		response.sendRedirect(request.getContextPath()+"/main.do");

	}

}
