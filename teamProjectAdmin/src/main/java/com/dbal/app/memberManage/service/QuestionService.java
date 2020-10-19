package com.dbal.app.memberManage.service;

import java.util.List;

import org.aspectj.weaver.patterns.TypePatternQuestions.Question;

import com.dbal.app.memberManage.Answer;
import com.dbal.app.memberManage.Questions;

public interface QuestionService {
	public List<Questions> selectAll(Questions questions);
	public Questions selectOne(Questions questions);

	// 답변 등록
	public void  insert(Questions questions);
public void updateNo();
	//public void updateNo1();
	
	public void updateStatus(Questions questions);
}
