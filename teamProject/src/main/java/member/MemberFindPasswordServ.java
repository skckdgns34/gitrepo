package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Member;

public class MemberFindPasswordServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member memberVO = new Member();
		memberVO.setMember_pw(request.getParameter("member_pw"));
		memberVO.setMember_email(request.getParameter("member_email"));

		
		MemberDAO dao = new MemberDAO();
		dao.pwupdate(memberVO);
		
		request.getRequestDispatcher("/app/memberLogin.do").forward(request, response);

	}
}