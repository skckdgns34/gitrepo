package licence;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;


public class LicenceAmount implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String account = request.getParameter("account");
		System.out.println(account);
		request.setAttribute("pay", account);
		request.getRequestDispatcher("licence/licenceClick.jsp").forward(request, response);
		
	}

}
