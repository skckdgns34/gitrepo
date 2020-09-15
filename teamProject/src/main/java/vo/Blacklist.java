package vo;

import lombok.Data;

@Data
public class Blacklist {
	private String blacklist_no;
	private String blacklist_reason;
	private String member_no;
	private String limit_date;
}
