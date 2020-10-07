package com.dbal.app.purchase.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.purchase.Purchase;
import com.dbal.app.purchase.service.PurchaseService;

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


