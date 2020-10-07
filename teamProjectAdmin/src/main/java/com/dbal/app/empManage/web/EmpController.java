package com.dbal.app.empManage.web;

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
				
				page = "redirect:/";
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
    
    //목록조회 
    @RequestMapping("/empManageMain.ad")
    public String selectAll(Model model) {
        model.addAttribute("list", empService.selectAll(null));
        return "empManage/empManageList";
    }
    
    //등록폼
    @RequestMapping("insertFormEmp")
    public String insertFormEmp(Employees employees) {
        return "emp/insertEmp";
    }

    //등록처리
    @RequestMapping("insertEmp")
    public String insertEmp(Employees employees) {
        //empService.empInsert(vo);
        return "redirect:empList";
    }
    
    
    
}


