package com.dbal.app.memberManage.mapper;

import java.util.List;

import org.aspectj.weaver.patterns.TypePatternQuestions.Question;

import com.dbal.app.memberManage.Notice;
import com.dbal.app.memberManage.Questions;

public interface QuestionDAO {
	
	// 전체조회
	public List<Questions> selectAll(Questions questions);
	
	//한건 조회
	public Questions selectOne(Question questions);
	
	
}
