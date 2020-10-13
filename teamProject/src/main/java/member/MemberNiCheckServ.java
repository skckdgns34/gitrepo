package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class MemberNiCheckServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname = request.getParameter("nickname");
		
		int b = 0;
		MemberDAO dao = new MemberDAO();
		b = dao.memberNiCheck(nickname);
		response.getWriter().print(b);
	}

}
