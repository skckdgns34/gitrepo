package com.dbal.app.memberManage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.memberManage.Blacklist;
import com.dbal.app.memberManage.mapper.BlackListDAO;
import com.dbal.app.memberManage.service.BlackListService;

@Service
public class BlackListServiceImpl implements BlackListService {
	@Autowired BlackListDAO blackListDAO;
	
	@Override
	public List<Blacklist> selectAllList(Blacklist blacklist) {
		return blackListDAO.selectAllList(blacklist);
	}

	@Override
	public Blacklist selectOne(Blacklist black) {
		return blackListDAO.selectOne(black);
	}

	@Override
	public void delete(Blacklist black) {
		blackListDAO.delete(black);
	}

	@Override
	public void update(Blacklist black) {
		blackListDAO.update(black);
	}

	@Override
	public void insert(Blacklist black) {
		blackListDAO.updateNo();
		blackListDAO.insert(black);
		
	}

	@Override
	public void updateNo() {
		
	}

}
