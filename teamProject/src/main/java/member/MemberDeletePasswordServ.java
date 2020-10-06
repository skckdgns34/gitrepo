package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Member;

public class MemberDeletePasswordServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String member_pw = request.getParameter("member_pw");
		String page = "/member/memberDeletePassword.jsp";
		
		if(member_pw == null) {
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			
			Member memberVO = new Member();
			memberVO.setMember_id((String)request.getSession().getAttribute("member_id"));
			memberVO.setMember_pw(member_pw);
			
			Member resultVO = MemberDAO.getinstance().password(memberVO);
			
			if(resultVO == null) {
				request.setAttribute("errormsg", "비밀번호를 다시 입력해주세요");
				request.getRequestDispatcher(page).forward(request, response);
			} else {
				PrintWriter out=response.getWriter();
				response.resetBuffer();
				out.print("<script>");
				out.println("window.opener.document.getElementById('pwcheck').value = '확인';");
				out.print("opener.ToggleButton();");
				out.print("window.close();");
				out.print("</script>");
			}
			
	
		}
		
	}
	
}
