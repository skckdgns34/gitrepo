package empManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Employees;

public class EmployeesInsertConrtoller implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("직원 등록 ");
		 /*MPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, "
				+ " PHONE_NUMBER, HIRE_DATE, JOB_ID, 
				SALARY, COMMISSION_PCT, MANAGER_ID,DEPARTMENT_ID, ID, PASSWORD */
		 
		 String emp_no = request.getParameter("emp_no");
		 String emp_id = request.getParameter("emp_id");
		 String emp_pw = request.getParameter("emp_pw");
		 String emp_name = request.getParameter("emp_name");
		 String emp_birth = request.getParameter("emp_birth");
		 String entereddate = request.getParameter("entereddate");
		 String dept_code = request.getParameter("dept_code");
		 String address1 = request.getParameter("address1");
		 String address2 = request.getParameter("address2");
		 String address3 = request.getParameter("address3");
		 String address4 = request.getParameter("address4");
		 String address5 = request.getParameter("address5");
		 String rank_code = request.getParameter("rank_code");
		
		 String emp_address = address1 +"," +address2 +","+address3 +","+address4
				 +","+address5;
		 
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
		 Employees  r = EmpDAO.getInstance().Insert(employees);
		 request.setAttribute("cnt", r);
		 request.getRequestDispatcher("/empManageList.ad").forward(request, response);

	}

}
