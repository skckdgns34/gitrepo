package com.dbal.app.empManage.mapper;

import java.util.List;

import com.dbal.app.empManage.Employees;

public interface EmpDAO {
	// 사원 한 건 조회
	public Employees selectOne(Employees Employees);

	// 전체 조회
	public List<Employees> selectAll(Employees employeesVO);

	// 등록
	public Employees Insert(Employees employees);

	// 수정
	public void Update(Employees emp);

	// 삭제
	public int Delete(Employees emp);

	// 로그인 체크
	public Employees loginCk(Employees employees);
}
