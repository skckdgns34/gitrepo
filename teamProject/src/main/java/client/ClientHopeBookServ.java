package client;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Hopebooks;

public class ClientHopeBookServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		HopeBookDAO hopebookDAO = new HopeBookDAO();
		Hopebooks hopebooks = new Hopebooks();
		
		hopebooks.setMember_no((String)request.getSession().getAttribute("member_no"));
		
		ArrayList<Hopebooks> list = hopebookDAO.selectAll(hopebooks);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/client/clientHopebookList.jsp").forward(request, response);

	}

}
