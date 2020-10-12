package com.dbal.app.memberManage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.memberManage.Hopebooks;
import com.dbal.app.memberManage.mapper.HopebooksListDAO;
import com.dbal.app.memberManage.service.HopebooksListService;

@Service
public class HopebookListServiceImpl implements HopebooksListService {
	@Autowired HopebooksListDAO hopebooksDAO;

	@Override
	public List<Hopebooks> selectAll(Hopebooks hopebooks) {
		return hopebooksDAO.selectAll(hopebooks);
	}
	

}
