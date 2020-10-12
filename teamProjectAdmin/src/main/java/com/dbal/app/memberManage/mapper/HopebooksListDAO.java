package com.dbal.app.memberManage.mapper;

import java.util.List;

import com.dbal.app.memberManage.Hopebooks;


public interface HopebooksListDAO {
		// 전체조회
		public List<Hopebooks> selectAll(Hopebooks hopebooks);

}
