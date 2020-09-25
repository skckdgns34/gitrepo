package memberManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Member;

public class MemberManageModifyFormServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member id = new Member();
		request.getSession().getAttribute("id");
		Member member = MemberManageDAO.getinstance().selectOne(id);
		
		request.setAttribute("member_no", member.getMember_no());
		request.setAttribute("member_pw", member.getMember_pw());
		request.setAttribute("nickname", member.getNickname());
		request.setAttribute("member_tel", member.getMember_tel());
		request.setAttribute("member_email", member.getMember_email());
		request.setAttribute("gender", member.getGender());	
		request.setAttribute("ticket_code", member.getTicket_code());
		request.setAttribute("ticket_date", member.getTicket_date());
		
		request.getRequestDispatcher("/memberManage/memberManageModify.jsp").forward(request, response);	
	}

}
