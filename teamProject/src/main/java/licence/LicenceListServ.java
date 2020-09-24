package licence;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Common;

public class LicenceListServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		ArrayList<Common> commonList = new ArrayList<Common>();
		commonList = LicenceDAO.getInstance().selectAllLicence();
		
		request.setAttribute("commonList", commonList);
		request.getRequestDispatcher("licence/licenceList.jsp").forward(request, response);
		
	}

}
