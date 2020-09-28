package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class MemberFindPasswordServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String AuthenticationKey = (String) request.getSession().getAttribute("AuthenticationKey");
		String AuthenticationUser = request.getParameter("AuthenticationUser");
		if (!AuthenticationKey.equals(AuthenticationUser)) {
			System.out.println("인증번호 일치하지 않음");
			request.setAttribute("msg", "인증번호가 일치하지 않습니다");
			request.setAttribute("loc", "member/memberPassword.jsp");
			request.getRequestDispatcher("member/memberPassword.jsp").forward(request, response);
			return;
		}

	}
}