package com.dbal.app.purchase.service;

import java.util.ArrayList;

import com.dbal.app.purchase.Purchase;

public interface PurchaseService {
	public ArrayList<Purchase> selectAll(Purchase purchase);
}
