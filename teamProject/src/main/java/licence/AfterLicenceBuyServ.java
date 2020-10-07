package licence;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.PayVO;

public class AfterLicenceBuyServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_no = (String)request.getSession().getAttribute("member_no");
		String ticket_code = request.getParameter("ticket_code");
		
		PayVO payVO = new PayVO();
		payVO.setMember_no(member_no);
		payVO.setTicket_code(ticket_code);
		
		PayDAO dao = new PayDAO();
		dao.insertPay(payVO);
	}
}
