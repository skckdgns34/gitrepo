package com.dbal.app.moneyManage.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dbal.app.books.Books;
import com.dbal.app.moneyManage.PayVO;
import com.dbal.app.moneyManage.SearchVO;
import com.dbal.app.moneyManage.service.PayService;

@Controller
public class PayController  {

    @Autowired
    PayService payService;
    
    @RequestMapping("/moneyOutListForm.ad")
    public String moneyOutListForm(){
    	return "moneyManage/moneyOutList";
    }
    
    @RequestMapping("/moneyOutList.ad")
    @ResponseBody
    public ArrayList<PayVO> moneyOutList(Model model, PayVO pay, SearchVO search, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	String startdate = request.getParameter("startdate"); //시작일
    	String enddate = request.getParameter("enddate"); //끝일
    	String quarteryear = request.getParameter("quarterYear"); //받아온년도
    	String quarter = request.getParameter("quarter"); //1234분기
    	
    	
    	
    	ArrayList<PayVO> lista = new ArrayList<PayVO>();
    	if (quarter.equals("aquarter")) {
    		ArrayList<PayVO> r = payService.selectAll(pay);  //전체조회
    		lista.addAll(r);
    	}
    	if (startdate != null) {
    		ArrayList<PayVO> r = payService.selectOne(search);  //날짜선택
    		lista.addAll(r);
    	}
    	if (quarter.equals("fquarter")) {
    		ArrayList<PayVO> r = payService.selectfQuarterPay(search);  //1분기
    		lista.addAll(r);
    	}
    	if (quarter.equals("squarter")) {
    		ArrayList<PayVO> r = payService.selectsQuarterPay(search);  //2분기
    		lista.addAll(r);
    	}
    	if (quarter.equals("tquarter")) {
    		ArrayList<PayVO> r = payService.selecttQuarterPay(search);  //3분기
    		lista.addAll(r);
    	}
    	if (quarter.equals("qquarter")) {
    		ArrayList<PayVO> r = payService.selectqQuarterPay(search);  //4분기
    		lista.addAll(r);
    	}
    	
    	return lista;
    }
    
    @RequestMapping(value="/myAreaChart.ad" )
	@ResponseBody
	public List<PayVO> myAreaChart(PayVO pay) {
		return payService.myAreaChart();
	}
    
}


