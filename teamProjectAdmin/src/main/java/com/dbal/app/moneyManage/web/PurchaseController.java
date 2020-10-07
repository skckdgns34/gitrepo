package com.dbal.app.moneyManage.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.moneyManage.Purchase;
import com.dbal.app.moneyManage.service.PurchaseService;

@Controller
public class PurchaseController  {

    @Autowired
    PurchaseService purchaseService;
    
    @RequestMapping("/moneyInList.ad")
    public String moneyInList(Model model, Purchase purchase) {
    	model.addAttribute("list", purchaseService.selectAll(purchase));
    	return"moneyManage/moneyInList";
    }
}


