package com.dbal.app.moneyManage.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dbal.app.moneyManage.service.PayService;

@Controller
public class PayController  {

    @Autowired
    PayService payService;
    
    
}


