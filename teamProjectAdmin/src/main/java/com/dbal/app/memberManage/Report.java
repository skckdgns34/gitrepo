package com.dbal.app.memberManage;

import lombok.Data;

@Data
public class Report {
	private String member_no;
	private String declaration_content;
	private String reported_member;
	private String declaration_no;
	private String declaration_date;
	private String declaration_code;
	private String book_no;
	private String review_no;
	private String code_value;
	private String contents;
	private String blacklist_no;
	private String blacklist_reason;
	private String limit_date;
	private String nickname;
}
