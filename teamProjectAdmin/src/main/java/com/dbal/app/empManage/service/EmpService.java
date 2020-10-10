package com.dbal.app.empManage.service;

import java.util.List;

import com.dbal.app.empManage.Employees;


public interface EmpService {

	public Employees selectOne(Employees Employees);
	public List<Employees> selectAll(Employees employeesVO);
	public void Insert(Employees employees);
	public void Update(Employees emp);
	public void Delete(Employees emp);
	public Employees loginCk(Employees employees);
	public int idCk(Employees employeesVO);

}
