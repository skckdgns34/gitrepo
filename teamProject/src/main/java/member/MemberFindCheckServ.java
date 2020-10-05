package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Member;

public class MemberFindCheckServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String AuthenticationKey = (String) request.getSession().getAttribute("AuthenticationKey");
		String AuthenticationUser = request.getParameter("AuthenticationUser");
		if (!AuthenticationKey.equals(AuthenticationUser)) {
			System.out.println("인증번호 일치하지 않음");
			request.setAttribute("msg", "인증번호가 일치하지 않습니다");
			request.setAttribute("loc", "member/memberFindPassword.jsp");
			request.getRequestDispatcher("member/memberFindPassword.jsp").forward(request, response);
			
		} else {
			System.out.println("인증번호 확인");
			request.setAttribute("msg", "인증번호 확인");
			request.getRequestDispatcher("member/memberFindPassword.jsp").forward(request, response);
		}
			
	}

}
