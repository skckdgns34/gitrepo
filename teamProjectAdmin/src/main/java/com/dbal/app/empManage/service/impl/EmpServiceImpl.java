package com.dbal.app.empManage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.empManage.Employees;
import com.dbal.app.empManage.mapper.EmpDAO;
import com.dbal.app.empManage.service.EmpService;


@Service
public class EmpServiceImpl implements EmpService {
	@Autowired EmpDAO empDAO;
	
	@Override
	public Employees selectOne(Employees Employees) {
		return empDAO.selectOne(Employees);
	}

	@Override
	public List<Employees> selectAll(Employees employeesVO) {
		return empDAO.selectAll(employeesVO);
	}

	@Override
	public Employees Insert(Employees employees) {
		return empDAO.Insert(employees);
	}

	@Override
	public void Update(Employees emp) {
		
	}

	@Override
	public int Delete(Employees emp) {
		return 0;
	}

	@Override
	public Employees loginCk(Employees employees) {

		return empDAO.loginCk(employees);
	}

	

}
