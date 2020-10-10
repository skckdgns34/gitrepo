package com.dbal.app.memberManage.service;

import java.util.List;

import org.aspectj.weaver.patterns.TypePatternQuestions.Question;

import com.dbal.app.memberManage.Answer;
import com.dbal.app.memberManage.Questions;

public interface QuestionService {
	public List<Questions> selectAll(Questions questions);
	public Questions selectOne(Questions questions);

	public void  insert(Answer answer);
		
	
	public void updateStatus(Questions questions);
}
