package com.dbal.app.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dbal.app.empManage.Employees;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        
	        HttpSession session = request.getSession();
	        Employees loginVO = (Employees) session.getAttribute("login");
	 

	        if(loginVO == null){
	            response.sendRedirect("/insa/loginForm.ad");
	            return false;
	        }

	        
	        return true;
	    }
}
