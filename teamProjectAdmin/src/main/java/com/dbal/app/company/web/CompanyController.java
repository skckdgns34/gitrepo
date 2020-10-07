package com.dbal.app.company.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dbal.app.company.Company;
import com.dbal.app.company.service.CompanyService;

@Controller
public class CompanyController  {

    @Autowired
    CompanyService companyService;
    
    //출판사 목록
    @RequestMapping("/companyMain.ad")
    public String selectAll(Model model, Company company) {
    	model.addAttribute("list",companyService.selectAll(company));
    	return "company/companyMain";
    }
    
    //출판사 등록페이지 이동
    @RequestMapping(value = "/companyRegister.ad", method = RequestMethod.GET)
    public String companyRegisterForm() {
    	return "company/companyRegister";
    }
    
    //출판사 등록
    @RequestMapping(value = "/companyRegister.ad", method = RequestMethod.POST)
    public String companyRegister(Company company) {
    	companyService.insert(company);
    	return "redirect:/companyMain.ad";
    }
    
    //출판사 선택
    @RequestMapping(value = "/companySelect.ad", method = RequestMethod.GET)
    public String selectOne(Model model, Company company, HttpServletRequest request) {
    	String no = request.getParameter("company_code");
    	company.setCompany_code(no);
    	model.addAttribute("result",companyService.selectOne(company));
    	return "company/companyModify";
    }
    
    @RequestMapping(value = "/companyPop.ad", method = RequestMethod.POST)
    public String companyPop(Company company) {
    	companyService.update(company);
    	return "redirect:/companyMain.ad";
    }
}


