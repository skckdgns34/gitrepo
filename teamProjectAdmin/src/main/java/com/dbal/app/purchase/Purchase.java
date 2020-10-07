package com.dbal.app.purchase;

import lombok.Data;

@Data
public class Purchase {
	private String purchase_no;
	private String purchase_price;
	private String purchase_date;
	private String purchase_content;
	private String emp_no;
	private String book_no;
	private String title;
	private String emp_name;
}
