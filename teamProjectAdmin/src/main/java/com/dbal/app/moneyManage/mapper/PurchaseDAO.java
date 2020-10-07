package com.dbal.app.moneyManage.mapper;

import java.util.ArrayList;

import com.dbal.app.moneyManage.Purchase;

public interface PurchaseDAO {
	public ArrayList<Purchase> selectAll(Purchase purchase);
}
