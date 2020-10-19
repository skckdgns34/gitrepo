package com.dbal.app.mywriting.mapper;

import java.util.ArrayList;

import com.dbal.app.mywriting.Mywriting;

public interface MywritingDAO {
	//도서전체조회
	public ArrayList<Mywriting> selectMy(Mywriting mywriting);
}
