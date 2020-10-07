package com.dbal.app.empManage;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Employees {
	
	private String emp_no;
	private String emp_id;
	private String emp_pw;
	private String emp_name;
	private String emp_birth;
	private String entereddate;
	private String dept_code;
	private String emp_address;
	private String rank_code;
}
