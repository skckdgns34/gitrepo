package company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookManage.BookManageDAO;
import common.Controller;
import vo.Books;
import vo.Company;

public class CompanySelectServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("company_code");

		Company company = new Company();
		company.setCompany_code(id);
		Company resultVO = new Company();
		resultVO = CompanyDAO.getInstance().selectOne(company);

		request.setAttribute("result", resultVO);
		request.getRequestDispatcher("/company/companyModify.jsp").forward(request, response);
	}

}
