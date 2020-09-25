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
		
		 List<Company> list = CompanyDAO.getInstance().selectAll();
		 request.setAttribute("list", list);
		 request.getRequestDispatcher("/bookManage/bookList.jsp").forward(request,
		 response);
		 
	}

}
