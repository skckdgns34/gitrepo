package vo;

import lombok.Data;

@Data
public class Purchase {
	private String purchase_no;
	private String purchase_price;
	private String purchase_subject;
	private String purchase_date;
	private String purchase_status;
	private String purchase_content;
	private String total_price;
	private String company_code;
	private String emp_no;
	private String count;
}
