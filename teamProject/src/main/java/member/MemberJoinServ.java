package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Member;

public class MemberJoinServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("등록실행");
		
		Member memberVO = new Member();
		memberVO.setMember_id(request.getParameter("member_id"));
		memberVO.setMember_pw(request.getParameter("member_pw"));
		memberVO.setNickname(request.getParameter("nickname"));
		memberVO.setMember_tel(request.getParameter("member_tel"));
		memberVO.setMember_email(request.getParameter("member_email"));
		memberVO.setGender(request.getParameter("gender"));
		
		MemberDAO dao = new MemberDAO();
		dao.insert(memberVO);
		
		request.getRequestDispatcher("member/Hello.jsp").forward(request, response);

	}

}
