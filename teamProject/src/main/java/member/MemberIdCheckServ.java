package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class MemberIdCheckServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_id = request.getParameter("member_id");
		
		int a = 0;
		MemberDAO dao = new MemberDAO();
		a = dao.memberIdCheck(member_id);
		response.getWriter().print(a);
		
	}

}
