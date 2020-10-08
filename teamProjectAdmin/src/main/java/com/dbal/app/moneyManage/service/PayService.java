package com.dbal.app.moneyManage.service;

import java.util.ArrayList;
import java.util.List;

import com.dbal.app.books.Books;
import com.dbal.app.moneyManage.PayVO;
import com.dbal.app.moneyManage.SearchVO;

public interface PayService {
		//매출 날짜 선택 조회
		public ArrayList<PayVO> selectOne(SearchVO search);
		
		//매출 전체조회
		public ArrayList<PayVO> selectAll(PayVO pay);
		
		//1분기
		public ArrayList<PayVO> selectfQuarterPay(String t);
		
		//2분기
		public ArrayList<PayVO> selectsQuarterPay(String t);
		
		//3분기
		public ArrayList<PayVO> selecttQuarterPay(String t);
		
		//4분기 검색
		public ArrayList<PayVO> selectqQuarterPay(String t);
		
		public List<PayVO> myAreaChart();
	
}
