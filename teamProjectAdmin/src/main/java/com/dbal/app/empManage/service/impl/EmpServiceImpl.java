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
	public void Insert(Employees employees) {
		empDAO.updateNo();
		empDAO.Insert(employees);
	}

	@Override
	public void Update(Employees emp) {
		empDAO.Update(emp);
	}

	@Override
	public void Delete(Employees emp) {
		empDAO.Delete(emp);
	}

	@Override
	public Employees loginCk(Employees employees) {

		return empDAO.loginCk(employees);
	}

	@Override
	public int idCk(Employees employeesVO) {
		int result = empDAO.idCk(employeesVO);
		return result;
	}

	

}
