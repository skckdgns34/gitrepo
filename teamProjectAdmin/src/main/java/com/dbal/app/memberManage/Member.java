package com.dbal.app.memberManage;

import lombok.Data;

@Data
public class Member {
	private String member_no;
	private String member_id;
	private String member_pw;
	private String nickname;
	private String member_tel;
	private String member_email;
	private String signup_date;
	private String ticket_date;
	private String last_access_date;
	private String code_value;
	private String ticket_code;
	private String gender;
	private String female;
	private String male;
	
	private String pay_no;
	private String pay_date;

	private String review_no;
	private String contents;
	private String review_date;
	private String book_no;

	private String mylibrary_no;
	private String wish;
	private String last_read_index;
}
