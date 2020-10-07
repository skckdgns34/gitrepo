package com.dbal.app.memberManage.mapper;

import java.util.List;

import com.dbal.app.memberManage.Questions;

public interface QuestionDAO {
	
	// 전체조회
	public List<Questions> selectAll(Questions questions);
	
	
}
