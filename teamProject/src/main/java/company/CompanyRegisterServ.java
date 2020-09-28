package company;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import bookManage.BookManageDAO;
import common.Controller;
import vo.Books;
import vo.Company;

public class CompanyRegisterServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Company company = new Company();

		try {
			BeanUtils.copyProperties(company, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Company r = CompanyDAO.getInstance().insert(company);
		request.getRequestDispatcher("companyMain.ad").forward(request, response);

	}

}
