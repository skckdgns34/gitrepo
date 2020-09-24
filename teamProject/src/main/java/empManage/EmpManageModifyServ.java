package empManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Employees;

public class EmpManageModifyServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		//String id = request.getParameter("id");
	String emp_no = request.getParameter("emp_no");
	String emp_id = request.getParameter("emp_id");
	String emp_pw =request.getParameter("emp_pw");
	String emp_name = request.getParameter("emp_name");
	String emp_birth = request.getParameter("emp_birth");
	String entereddate = request.getParameter("entereddate");
	String dept_code = request.getParameter("dept_code");
	String emp_address = request.getParameter("emp_address");
	String rank_code = request.getParameter("rank_code");
	
	Employees employees = new Employees();
	employees.setEmp_no(emp_no);
	employees.setEmp_id(emp_id);
	employees.setEmp_pw(emp_pw);
	employees.setEmp_name(emp_name);
	employees.setEmp_birth(emp_birth);
	employees.setEntereddate(entereddate);
	employees.setDept_code(dept_code);
	employees.setEmp_address(emp_address);
	employees.setRank_code(rank_code);
	
	EmpDAO.getInstance().Update(employees);
	request.getRequestDispatcher("./adminIndex.jsp").forward(request, response);
	}

}
