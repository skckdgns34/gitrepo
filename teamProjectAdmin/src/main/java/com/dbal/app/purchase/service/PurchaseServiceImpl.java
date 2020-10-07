package com.dbal.app.purchase.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.purchase.Purchase;
import com.dbal.app.purchase.mapper.PurchaseDAO;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	@Autowired
	PurchaseDAO purchaseDAO;

	@Override
	public ArrayList<Purchase> selectAll(Purchase purchase) {
		return purchaseDAO.selectAll(purchase);
	}
}
