package com.dbal.app.moneyManage.service;

import java.util.ArrayList;

import com.dbal.app.moneyManage.Purchase;

public interface PurchaseService {
	public ArrayList<Purchase> selectAll(Purchase purchase);
}
