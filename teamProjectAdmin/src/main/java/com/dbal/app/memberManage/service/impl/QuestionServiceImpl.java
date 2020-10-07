package com.dbal.app.memberManage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
