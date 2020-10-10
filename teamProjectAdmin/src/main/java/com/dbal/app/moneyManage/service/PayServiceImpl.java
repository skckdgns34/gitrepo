package com.dbal.app.moneyManage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.moneyManage.PayVO;
import com.dbal.app.moneyManage.SearchVO;
import com.dbal.app.moneyManage.mapper.PayDAO;

@Service
public class PayServiceImpl implements PayService {
	@Autowired
	PayDAO payDAO;

	@Override
	public ArrayList<PayVO> selectOne(SearchVO search) {
		return payDAO.selectOne(search);
	}

	@Override
	public ArrayList<PayVO> selectAll(PayVO pay) {
		return payDAO.selectAll(pay);
	}

	@Override
	public ArrayList<PayVO> selectfQuarterPay(SearchVO search) {
		return payDAO.selectfQuarterPay(search);
	}

	@Override
	public ArrayList<PayVO> selectsQuarterPay(SearchVO search) {
		return payDAO.selectsQuarterPay(search);
	}

	@Override
	public ArrayList<PayVO> selecttQuarterPay(SearchVO search) {
		return payDAO.selecttQuarterPay(search);
	}

	@Override
	public ArrayList<PayVO> selectqQuarterPay(SearchVO search) {
		return payDAO.selectqQuarterPay(search);
	}

	@Override
	public List<PayVO> myAreaChart() {
		return payDAO.myAreaChart();
	}

}
