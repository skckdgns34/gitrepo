package com.books.service;

import java.util.ArrayList;

import com.books.Books;

public interface BooksService {
	//매입입력
	Books insertpur (Books books);
	//도서입력
	public int insert (Books books);
	//도서삭제
	public int delete(Books book);
	//도서선택
	public Books selectOne(Books book);
	//도서전체조회
	public ArrayList<Books> selectAll(String search_text, String search_type);
	//도서정보업데이트
	public Books update(Books books);
	
}
