package vo;

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
	private String gender;
	private String ticket_code;
	
}
