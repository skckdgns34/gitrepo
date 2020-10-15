package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Member;

public class MemberLoginServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		Member memberVO = new Member();
		memberVO.setMember_id(request.getParameter("member_id"));
		memberVO.setMember_pw(request.getParameter("member_pw"));
		memberVO.setNickname(request.getParameter("nickname"));
		memberVO.setMember_tel(request.getParameter("member_tel"));
		memberVO.setMember_email(request.getParameter("member_email"));

		
		Member resultVO = MemberDAO.getinstance().selectOne(memberVO);
		
		
		String page = "";
		if(resultVO==null) {	//id가 없음
			page = "member/memberLogin.jsp";
			request.setAttribute("errormsg", "해당ID가 없습니다.");
		} else {
			if(memberVO.getMember_pw().equals(resultVO.getMember_pw())) {	//로그인 성공
				page = "/index.jsp";
				request.getSession().setAttribute("memberLogin", resultVO);
				request.getSession().setAttribute("member_id", resultVO.getMember_id());
				request.getSession().setAttribute("member_no", resultVO.getMember_no());
				request.getSession().setAttribute("nickname", resultVO.getNickname());
				request.getSession().setAttribute("member_tel", resultVO.getMember_tel());
				request.getSession().setAttribute("member_email", resultVO.getMember_email());
				MemberDAO dao = new MemberDAO();
				dao.lastaccessdate(memberVO);
				
			} else {	//패스워드 불일치
				request.setAttribute("errormsg", "패스워드 불일치");
				page = "member/memberLogin.jsp";
			}
		}
		
		request.getRequestDispatcher(page).forward(request, response);

	}

}
