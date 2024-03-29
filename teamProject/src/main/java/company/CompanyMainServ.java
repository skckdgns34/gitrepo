package company;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Company;

public class CompanyMainServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		String search_text = request.getParameter("search_text");
		String search_type = request.getParameter("search_type");
		
		List<Company> list = CompanyDAO.getInstance().selectAll(search_text, search_type);
		
		request.setAttribute("list", list);
		request.setAttribute("search_type", search_type);
		request.setAttribute("search_text", search_text);
		request.getRequestDispatcher("/company/companyMain.jsp").forward(request,
		 response);
		 
	}

}
