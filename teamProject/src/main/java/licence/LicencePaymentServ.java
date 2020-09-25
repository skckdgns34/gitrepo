package licence;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import member.MemberDAO;
import vo.Member;

public class LicencePaymentServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		Member memberVO = new Member();
		String id = (String) request.getSession().getAttribute("member_id");
		memberVO.setMember_id(id);
		Member resultVO = new Member();
		resultVO = MemberDAO.getinstance().selectOne(memberVO);
		System.out.println(resultVO.getTicket_date());
		request.setAttribute("loginMember", resultVO);
		request.getRequestDispatcher("licence/licencePayment.jsp").forward(request, response);
	}

}
