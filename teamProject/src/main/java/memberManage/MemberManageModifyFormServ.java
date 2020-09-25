package memberManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Member;

public class MemberManageModifyFormServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member memberVO = new Member();
		String no =request.getParameter("no");
		memberVO.setMember_no(no);
		Member member = MemberManageDAO.getinstance().selectOne(memberVO);
		
		request.setAttribute("member", member);
		
		request.getRequestDispatcher("/memberManage/memberManageModify.jsp").forward(request, response);	
	}

}
