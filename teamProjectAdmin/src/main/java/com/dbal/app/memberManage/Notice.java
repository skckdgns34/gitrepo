package com.dbal.app.memberManage;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class Notice {
	private String notice_no;
	private String notice_title;
	private String notice_date;
	private String notice_content;
	private String notice_img;
	private String emp_no;
	private String views;
	private int first;
	private int last;
	private String emp_name;
}
