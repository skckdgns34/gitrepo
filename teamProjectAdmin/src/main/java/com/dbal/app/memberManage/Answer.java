package com.dbal.app.memberManage;

import lombok.Data;

@Data
public class Answer {
	private String answer_no;
	private String answer_contents;
	private String answer_date;
	private String question_no;
	private String answer_writer;
	private String question_status;
	
}
