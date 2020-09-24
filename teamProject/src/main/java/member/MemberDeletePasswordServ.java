package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import common.Controller;
import vo.Member;

public class MemberDeletePasswordServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member memberVO = new Member();
		memberVO.setMember_id(request.getParameter("member_id"));
		memberVO.setMember_pw(request.getParameter("member_pw"));
		System.out.println(memberVO);
		Member resultVO = MemberDAO.getinstance().selectOne(memberVO);

		String page = "";
		if(memberVO.getMember_pw().equals(resultVO.getMember_pw())) {
			request.getSession().setAttribute("member_pw", resultVO.getMember_pw());
			page = "/member/MemberDeletePassword.jsp";
		} else {
			request.setAttribute("msg", "비밀번호를 제대로 입력해주세요.");
			page = "/member/MemberDeletePassword.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}
	
}
