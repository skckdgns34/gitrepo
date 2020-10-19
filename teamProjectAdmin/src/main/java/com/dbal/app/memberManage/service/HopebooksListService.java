package com.dbal.app.memberManage.service;

import java.util.List;

import com.dbal.app.memberManage.Hopebooks;


public interface HopebooksListService {
		// 전체조회
		public List<Hopebooks> selectAll(Hopebooks hopebooks);

}
