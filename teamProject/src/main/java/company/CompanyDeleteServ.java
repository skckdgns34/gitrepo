package company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookManage.BookManageDAO;
import common.Controller;
import vo.Company;

public class CompanyDeleteServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("company_code");

		Company company = new Company();
		company.setCompany_code(id);

		CompanyDAO.getInstance().delete(company);
		request.getRequestDispatcher("companyMain.ad").forward(request, response);

	}

}
