package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.License;

public class MemberLicenseServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		MemberBookDAO dao = new MemberBookDAO();
		License license = new License();
		
		license.setMember_no((String)request.getSession().getAttribute("member_no"));

		ArrayList<License> list = dao.LicenseList(license);
		request.setAttribute("list", list);
		request.getRequestDispatcher("member/memberLicense.jsp").forward(request, response);
	}

}
