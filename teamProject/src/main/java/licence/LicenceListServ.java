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
import vo.TicketVO;

public class LicenceListServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//이용권 리스트를 위한 select
		ArrayList<Common> commonList = new ArrayList<Common>();
		commonList = LicenceDAO.getInstance().selectAllLicence();
		
		//사용자 member_no읽어와서 얘가 갖고있는 ticket_code 읽을거임.
		Member memberVO = new Member();
		String no = (String) request.getSession().getAttribute("member_no");
		memberVO.setMember_no(no);
		
		//해당 사용자 이용권 목록
		List<TicketVO> list = new ArrayList<TicketVO>();
		list = TicketDAO.getInstance().selectAll(memberVO);
		
		
		request.setAttribute("member_ticket_list", list);
		request.setAttribute("commonList", commonList);
		request.getRequestDispatcher("licence/licenceList.jsp").forward(request, response);
		
	}

}
