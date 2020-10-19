package com.dbal.app.mywriting.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.mywriting.Mywriting;
import com.dbal.app.mywriting.service.MywritingService;

@Controller
public class MywritingController  {

    @Autowired
    MywritingService mywritingService;
    
    //전체도서 조회
    @RequestMapping("/mybookList.ad")
    public String selectMy(Model model,Mywriting mywriting){
    	model.addAttribute("list",mywritingService.selectMy(mywriting));
    	return "mywriting/mywritingList";
    }
    
    
}


