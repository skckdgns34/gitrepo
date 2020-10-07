package com.dbal.app.empManage.service;

import java.util.List;

import com.dbal.app.empManage.Employees;


public interface EmpService {

	public Employees selectOne(Employees Employees);
	public List<Employees> selectAll(Employees employeesVO);
	public Employees Insert(Employees employees);
	public void Update(Employees emp);
	public int Delete(Employees emp);
	public Employees loginCk(Employees employees);

}
