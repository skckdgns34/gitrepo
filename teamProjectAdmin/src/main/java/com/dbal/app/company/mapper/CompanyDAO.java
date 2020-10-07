package com.dbal.app.company.mapper;

import java.util.ArrayList;

import com.dbal.app.books.Books;
import com.dbal.app.company.Company;

public interface CompanyDAO {
	//출판사 입력
	public void insert (Company company);
	//출판사삭제
	public int delete(Company company);
	//출판사 선택
	public Company selectOne(Company company);
	//출판사 조회
	public ArrayList<Company> selectAll(Company company);
	//출판사 수정
	public void update(Company company);
	
	public void updateComNo();
}
