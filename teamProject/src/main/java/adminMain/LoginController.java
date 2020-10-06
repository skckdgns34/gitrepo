package adminMain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import empManage.EmpDAO;
import vo.Employees;



public class LoginController implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employees employees = new Employees();
		employees.setEmp_id(request.getParameter("emp_id"));
		employees.setEmp_pw(request.getParameter("emp_pw"));
		employees.setEmp_no(request.getParameter("emp_no"));
		employees.setEmp_name(request.getParameter("emp_name"));
		
		// 2. 서비스 처리(DB)
		Employees resultVo = EmpDAO.getInstance().loginCk(employees);
		

		// 3. 결과저장
		String page = "";
		if (resultVo == null) { // id 가 없음
			request.setAttribute("errormsg", "해당 ID가 없습니다.");
			request.setAttribute("errorcode", "1");
			page = "adminMain/login.jsp";
			System.out.println("해당 ID 가 없습니다.");
		} else {
			if(employees.getEmp_pw().equals(resultVo.getEmp_pw())) { //로그인 성공 시 세션에 어트리뷰트 속성저장?
				request.getSession().setAttribute("login", resultVo);
				request.getSession().setAttribute("emp_id", resultVo.getEmp_id());
				
				page = "/adminIndex.jsp";
				System.out.println("로그인 성공");
			}else { //패스워드 불일치
				request.setAttribute("errormsg", "Password가 잘 못 되었습니다.");
				request.setAttribute("errorcode", "1");
				page = "adminMain/login.jsp";
				System.out.println("패스워드 불일치");

			}
		}
		// 4.뷰 페이지 이동(redirect, forward) 도는 뷰 페이지 출력
		System.out.println(page);
		request.getRequestDispatcher(page).forward(request, response);
	}

}
