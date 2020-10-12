package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import common.Controller;
import vo.Hopebooks;

public class ClientHopeBookWriteServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		Hopebooks hopebooks = new Hopebooks();

		try {
			BeanUtils.copyProperties(hopebooks, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String member = (String) request.getSession().getAttribute("member_no");
		hopebooks.setMember_no(member);
		HopeBookDAO.getinstance().insert(hopebooks);

		request.getRequestDispatcher("clientHopeBook.do").forward(request, response);

	}

}
