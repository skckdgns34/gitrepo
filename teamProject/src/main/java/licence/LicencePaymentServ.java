package licence;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import member.MemberDAO;
import vo.Member;
import vo.TicketVO;

public class LicencePaymentServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//세션에서 id 갖고오기
		Member memberVO = new Member();
		String id = (String) request.getSession().getAttribute("member_id");
		memberVO.setMember_id(id);
		
		
		//아이디로 no pk읽을꺼임
		Member resultVO = new Member();
		resultVO = MemberDAO.getinstance().selectOne(memberVO);
		
		System.out.println(resultVO.getMember_no());
		
		//읽어와서 해당회원의 이용권 목록 갖고올거임.
		List<TicketVO> list = new ArrayList<TicketVO>();
		list = TicketDAO.getInstance().selectAll(resultVO);
		
		for(int i =0 ; i<list.size(); i++) {
			list.get(i).
		}
		request.setAttribute("loginMember", list);
		request.getRequestDispatcher("licence/licencePayment.jsp").forward(request, response);
		
		
	}

}
