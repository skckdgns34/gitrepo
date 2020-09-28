package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Member;

public class MemberFindServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member memberVO = new Member();
		memberVO.setMember_id(request.getParameter("member_id"));
		memberVO.setMember_email(request.getParameter("member_email"));
		
		Member resultVO = MemberDAO.getinstance().findId(memberVO);

		String page = "";
		if(resultVO == null) {
			page = "member/memberFind.jsp";
			request.setAttribute("errormsg", "해당 이메일이 없습니다.");
		} else {
			memberVO.getMember_email().equals(resultVO.getMember_email());
			page = "/app/memberFindId.do";
			request.getSession().setAttribute("memberFind", resultVO);
			request.getSession().setAttribute("member_email", resultVO.getMember_email());
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

}
