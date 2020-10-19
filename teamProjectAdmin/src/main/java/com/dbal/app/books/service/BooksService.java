package com.dbal.app.books.service;

import java.util.ArrayList;

import com.dbal.app.books.Books;
import com.dbal.app.company.Company;

public interface BooksService {
	//ebook입력
	public void insert (Books books);
	//audiobook입력
	public void insertAudio (Books books);
	//도서삭제
	public int delete(Books book);
	//도서선택
	public Books selectOne(Books book);
	//도서전체조회
	public ArrayList<Books> selectAll(Books books);
	//도서정보업데이트
	public void update(Books books);
	
	public ArrayList<Books> bookselectCompany(Books books);
	
}
