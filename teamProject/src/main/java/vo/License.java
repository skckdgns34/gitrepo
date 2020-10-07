package vo;

import lombok.Data;

@Data
public class License {
	private String member_no;
	private String ticket_code;
	private String ticket_name;
	private String price;
	private String pay_date;
	private String ticket_date;
}
