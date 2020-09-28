package licence;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import ebook.CommonDAO;
import member.MemberDAO;
import vo.Common;
import vo.Member;
import vo.TicketVO;

public class LicencePaymentServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//세션에서 no 갖고오기
		Member memberVO = new Member();
		String no = (String) request.getSession().getAttribute("member_no");
		memberVO.setMember_no(no);
		
		//읽어와서 해당회원의 이용권 목록 갖고올거임.
		List<TicketVO> list = new ArrayList<TicketVO>();
		list = TicketDAO.getInstance().selectAll(memberVO);
		
		//회원의 이용권 읽어와서 공통코드의 value 반환
		List<Common> value_list = new ArrayList<Common>(); Common code_value = new
		Common(); for(int i = 0; i<list.size(); i++) { code_value =
		CommonDAO.getInstance().selectCodeValue(list.get(i).getTicket_code());
		value_list.add(code_value); code_value = new Common(); }
		 
		
		request.setAttribute("value_list", value_list);
		request.setAttribute("loginMember", list);
		request.getRequestDispatcher("licence/licencePayment.jsp").forward(request, response);
		
		
	}

}
