package com.dbal.app.moneyManage.mapper;

import java.util.ArrayList;

import com.dbal.app.moneyManage.PayVO;

public interface PayDAO {
	
	//매출 날짜 선택 조회
	public ArrayList<PayVO> selectOne(String a , String b);
	
	//매출 전체조회
	public ArrayList<PayVO> selectAll();
	
	//1분기
	public ArrayList<PayVO> selectfQuarterPay(String t);
	
	//2분기
	public ArrayList<PayVO> selectsQuarterPay(String t);
	
	//3분기
	public ArrayList<PayVO> selecttQuarterPay(String t);
	
	//4분기 검색
	public ArrayList<PayVO> selectqQuarterPay(String t);
	
}
