package com.dbal.app.memberManage.service;

import java.util.List;

import com.dbal.app.memberManage.Questions;

public interface QuestionService {
	public List<Questions> selectAll(Questions questions);
}
