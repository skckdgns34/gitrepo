package member;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class MemberLicenseServ implements Controller
{

	@SuppressWarnings("static-access")
	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		String member_no = (String)request.getSession().getAttribute("member_no");
		MemberBookDAO dao = new MemberBookDAO();
		List<Map<String, Object>> list = dao.ticketList(member_no);
		request.setAttribute("list", list);
		 
		
		request.getRequestDispatcher("member/memberLicense.jsp").forward(request, response);
		
		
	}

}
