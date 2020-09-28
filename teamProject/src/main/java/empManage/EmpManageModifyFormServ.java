package empManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Employees;

public class EmpManageModifyFormServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employees employeesVO = new Employees();
		String no = request.getParameter("no");
		employeesVO.setEmp_no(no);
		
		Employees employees = EmpDAO.getInstance().selectOne(employeesVO);
		String[] adr = 	employees.getEmp_address().split(",");
		request.setAttribute("adr", adr);	
		request.setAttribute("employees", employees);
		request.getRequestDispatcher("/empManage/empManageModify.jsp").forward(request, response);
	}

}
