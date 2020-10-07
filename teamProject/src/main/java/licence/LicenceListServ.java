package licence;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Common;
import vo.Member;
import vo.PayVO;
import vo.TicketVO;

public class LicenceListServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{

		
		//사용자 member_no읽어와서 얘가 갖고있는 ticket_code 읽을거임.
		Member memberVO = new Member();
		String no = (String) request.getSession().getAttribute("member_no");
		memberVO.setMember_no(no);
		
		//ticket list 조회.
		List<TicketVO> ticketList = TicketDAO.getInstance().selectAllList(no);
		
		
		//해당 사용자 이용권 목록
		List<PayVO> userTicketList = TicketDAO.getInstance().userTicketList(no);
		
		
		request.setAttribute("member_ticket_list", userTicketList);
		request.setAttribute("commonList", ticketList);
		request.getRequestDispatcher("licence/licenceList.jsp").forward(request, response);
		
	}

}
