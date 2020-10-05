package licence;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;


public class LicenceAmount implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String account = request.getParameter("account");
		String p_name = request.getParameter("p_name");

		request.setAttribute("pay", account);
		request.setAttribute("p_name", p_name);
		request.getRequestDispatcher("licence/licenceClick.jsp").forward(request, response);
		
	}

}
