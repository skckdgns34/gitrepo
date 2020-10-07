package com.dbal.app.company.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.company.Company;
import com.dbal.app.company.mapper.CompanyDAO;
import com.dbal.app.purchase.Purchase;

@Service
public class CompanyServiceImpl implements CompanyService {
	@Autowired
	CompanyDAO companyDAO;

	@Override
	public void insert(Company company) {
		companyDAO.insert(company);
		companyDAO.updateComNo();
	}

	@Override
	public int delete(Company company) {
		return companyDAO.delete(company);
	}

	@Override
	public Company selectOne(Company company) {
		return companyDAO.selectOne(company);
	}

	@Override
	public ArrayList<Company> selectAll(Company company) {
		return companyDAO.selectAll(company);
	}

	@Override
	public void update(Company company) {
		companyDAO.update(company);
	}

}
