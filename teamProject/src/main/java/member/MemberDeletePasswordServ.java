package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import common.Controller;
import vo.Member;

public class MemberDeletePasswordServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member memberVO = new Member();
		memberVO.setMember_id(request.getParameter("member_id"));
		memberVO.setMember_pw(request.getParameter("member_pw"));
		
		Member resultVO = MemberDAO.getinstance().password(memberVO);

		String page = "";
		if(resultVO == null) {
			page = "/member/memberDeletePassword.jsp";
			request.setAttribute("errormsg", "비밀번호를 다시 입력해주세요");
		} else {
			memberVO.getMember_pw().equals(resultVO.getMember_pw());
			page = "/member/memberDeletePassword.jsp";
			request.setAttribute("msg", "비밀번호 확인 완료");
			request.setAttribute("memberDeletePassword.jsp", resultVO);
			request.setAttribute("member_pw", resultVO.getMember_pw());
			
		}
			
		request.getRequestDispatcher(page).forward(request, response);
	}
	
}
