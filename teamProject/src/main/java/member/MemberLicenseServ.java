package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class MemberLicenseServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		MemberDAO dao = new MemberDAO();
		
		String p = request.getParameter("p");
		String ticket_code = request.getParameter("ticket_code");
	}

}
