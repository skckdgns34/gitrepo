package com.dbal.app.moneyManage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.moneyManage.Purchase;
import com.dbal.app.moneyManage.mapper.PurchaseDAO;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	@Autowired
	PurchaseDAO purchaseDAO;

	@Override
	public ArrayList<Purchase> selectAll(Purchase purchase) {
		return purchaseDAO.selectAll(purchase);
	}
}
