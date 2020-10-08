package com.dbal.app.empManage.web;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dbal.app.empManage.Employees;
import com.dbal.app.empManage.service.EmpService;


@Controller
public class EmpController  {

    @Autowired
    EmpService empService;
	//로그인 폼 
    @RequestMapping(value = "/loginForm.ad", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {

		return "adminMain/login";
	}
    //로그인처리
    @RequestMapping(value="/login.ad", method=RequestMethod.POST)
    public String loginCK(Model model, Employees employees, HttpServletRequest request) {
		Employees resultVo = empService.loginCk(employees);

		// 3. 결과저장
		String page = "";
		if (resultVo == null) { // id 가 없음
			request.setAttribute("errormsg", "해당 ID가 없습니다.");
			request.setAttribute("errorcode", "1");
			page = "adminMain/login";
			System.out.println("해당 ID 가 없습니다.");
		} else {
			if(employees.getEmp_pw().equals(resultVo.getEmp_pw())) { //로그인 성공 시 세션에 어트리뷰트 속성저장?
				request.getSession().setAttribute("login", resultVo);
				request.getSession().setAttribute("emp_id", resultVo.getEmp_id());
				
				page = "adminMain/adminMain";
				System.out.println("로그인 성공");
			}else { //패스워드 불일치
				request.setAttribute("errormsg", "Password가 잘 못 되었습니다.");
				request.setAttribute("errorcode", "1");
				page = "adminMain/login";
				System.out.println("패스워드 불일치");

			}
		}
    	return page;
    	
    }
    
    //로그아웃
    @RequestMapping("/logout.ad")
    public String logout(HttpServletRequest request) {
    	request.getSession().invalidate();
	return "redirect:/";
    }
    
    
    
  
    
    //목록조회 
    @RequestMapping("/empManageList.ad")
    
    public String selectAll(Model model, Employees employeesVO) {
        model.addAttribute("list", empService.selectAll(employeesVO));
        return "empManage/empManageList";
    }
    
    //등록폼
    @RequestMapping(value="/employeesInsertForm.ad", method = RequestMethod.GET)
    public String insertFormEmp() {
    	    	return "empManage/employeesInsert";
    }

    //등록처리
    @RequestMapping(value="/employeesInsert.ad",  method = RequestMethod.POST)
    public String insertEmp(Employees employees, HttpServletRequest request) {
    	
   	 String address1 = request.getParameter("address1");
	 String address2 = request.getParameter("address2");
	 String address3 = request.getParameter("address3");
	 String address4 = request.getParameter("address4");
	 String address5 = request.getParameter("address5");
	 String emp_address = address1 +"," +address2 +","+address3 +","+address4
			 +","+address5;
	 employees.setEmp_address(emp_address);
	 String emp_no = request.getParameter("emp_no");
	 employees.setEmp_no(emp_no);
       empService.Insert(employees);
        return "redirect:/empManageList.ad";
    }
    
    
    //수정 페이지
    @RequestMapping(value="/empManageModifyForm.ad",method = RequestMethod.GET)
    	public String empManageUpdateForm(Model model, Employees employees, HttpServletRequest request) {
    	Employees employee = empService.selectOne(employees);
    	String[] adr = employee.getEmp_address().split(",");
    	
    	model.addAttribute("employees",employee);
		model.addAttribute("adr", adr);		
		
    	return"empManage/empManageModify";
    }
    
    //수정 처리
    @RequestMapping(value="/employeesModify.ad", method = RequestMethod.POST)
    public String empManageUpdate(Employees employees) {
    	empService.Update(employees);
    	return "redirect:/empManageMain.ad";
    }
    
 //삭제
    @RequestMapping(value="/employeesDelete.ad", method = RequestMethod.GET)
    public String EmpManageDelete(Employees employees, HttpServletRequest request) {
    	String emp_no = request.getParameter("emp_no");
    	employees.setEmp_no(emp_no);
    	empService.Delete(employees);
    	return "redirect:/empManageList.ad";
    }
}


