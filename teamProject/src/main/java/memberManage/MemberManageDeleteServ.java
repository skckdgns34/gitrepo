package memberManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import member.MemberDAO;
import vo.Member;

public class MemberManageDeleteServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member memberVO = new Member();
		
		memberVO.setMember_no(request.getParameter("member_no"));
		
		MemberManageDAO dao = new MemberManageDAO();
		dao.delete(memberVO);
		
		
		request.getRequestDispatcher("/memberManageMain.ad").forward(request, response);
	}

}
