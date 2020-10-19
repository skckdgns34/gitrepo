package com.dbal.app.mywriting.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.mywriting.Mywriting;
import com.dbal.app.mywriting.mapper.MywritingDAO;

@Service
public class MywritingServiceImpl implements MywritingService {
	@Autowired MywritingDAO mywritingDAO;

	@Override
	public ArrayList<Mywriting> selectMy(Mywriting mywriting) {
		return mywritingDAO.selectMy(mywriting);
	}
	

}
