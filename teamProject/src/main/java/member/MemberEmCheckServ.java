package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class MemberEmCheckServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String member_email = request.getParameter("member_email");
		System.out.println(member_email);
		int c = 0;
		MemberDAO dao = new MemberDAO();
		c = dao.memberEmCheck(member_email);
		response.getWriter().print(c);
	}

}
