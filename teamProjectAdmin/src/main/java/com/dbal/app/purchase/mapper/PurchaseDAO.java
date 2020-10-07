package com.dbal.app.purchase.mapper;

import java.util.ArrayList;

import com.dbal.app.purchase.Purchase;

public interface PurchaseDAO {
	public ArrayList<Purchase> selectAll(Purchase purchase);
}
