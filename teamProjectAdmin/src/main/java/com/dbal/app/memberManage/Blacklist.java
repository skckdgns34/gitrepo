package com.dbal.app.memberManage;

import lombok.Data;

@Data
public class Blacklist {
	private String blacklist_no;
	private String blacklist_reason;
	private String member_no;
	private String limit_date;
	private String nickname;
	private String code_value;
}
