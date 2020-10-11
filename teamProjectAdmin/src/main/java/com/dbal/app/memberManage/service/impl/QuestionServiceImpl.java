package com.dbal.app.memberManage.service.impl;

import java.util.List;

import org.aspectj.weaver.patterns.TypePatternQuestions.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.memberManage.Answer;
import com.dbal.app.memberManage.Questions;
import com.dbal.app.memberManage.mapper.QuestionDAO;
import com.dbal.app.memberManage.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService{
	@Autowired QuestionDAO questionDAO;
	

	@Override
	public List<Questions> selectAll(Questions questions) {
		return questionDAO.selectAll(questions);
	}

	@Override
	public Questions selectOne(Questions questions) {
		return questionDAO.selectOne(questions);
	}

	@Override
	public void insert(Answer answer) {
			questionDAO.updateNo(); //번호 업데이트
			
			 questionDAO.insert(answer);
	}

	

	@Override
	public void updateStatus(Questions questions) {
		questionDAO.updateStatus(questions);
	}
	
	
	
}
