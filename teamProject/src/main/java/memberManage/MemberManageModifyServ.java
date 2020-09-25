package memberManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import member.MemberDAO;
import vo.Member;

public class MemberManageModifyServ implements Controller
{

	public void execute(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("회원 등록 / 수정");

		String member_no = request.getParameter("member_no");
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String nickname = request.getParameter("nickname");
		String member_tel =request.getParameter("member_tel");
		String member_email = request.getParameter("member_email");
		String signup_date = request.getParameter("signup_date");
		String ticket_date = request.getParameter("ticket_date");
		String last_access_date = request.getParameter("last_access_date");
		String gender =request.getParameter("gender");
		String ticket_code = request.getParameter("ticket_code");
		
		Member member = new Member(); 
		member.setMember_no(member_no);
		member.setMember_id(member_id);
		member.setMember_pw(member_pw);
		member.setMember_tel(member_tel);

		member.setNickname(nickname);
		member.setMember_email(member_email);
		member.setSignup_date(signup_date);
		member.setTicket_date(ticket_date);
		member.setLast_access_date(last_access_date);
		member.setGender(gender);
		member.setTicket_code(ticket_code);
	 MemberManageDAO.getinstance().update(member);
		
		request.getRequestDispatcher("/memberManage/memberManageMain.jsp").forward(request, response);
		
	}

}
