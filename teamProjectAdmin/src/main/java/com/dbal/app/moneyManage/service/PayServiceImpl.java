package com.dbal.app.moneyManage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.moneyManage.PayVO;
import com.dbal.app.moneyManage.mapper.PayDAO;

@Service
public class PayServiceImpl implements PayService {
	@Autowired
	PayDAO payDAO;

	@Override
	public ArrayList<PayVO> selectOne(String a, String b) {
		return payDAO.selectOne(a, b);
	}

	@Override
	public ArrayList<PayVO> selectAll() {
		return payDAO.selectAll();
	}

	@Override
	public ArrayList<PayVO> selectfQuarterPay(String t) {
		return payDAO.selectfQuarterPay(t);
	}

	@Override
	public ArrayList<PayVO> selectsQuarterPay(String t) {
		return payDAO.selectsQuarterPay(t);
	}

	@Override
	public ArrayList<PayVO> selecttQuarterPay(String t) {
		return payDAO.selecttQuarterPay(t);
	}

	@Override
	public ArrayList<PayVO> selectqQuarterPay(String t) {
		return payDAO.selectqQuarterPay(t);
	}

}
