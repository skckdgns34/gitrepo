package com.dbal.app.books.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dbal.app.books.Books;
import com.dbal.app.books.mapper.BooksDAO;

@Service
public class BooksServiceImpl implements BooksService {
	@Autowired BooksDAO booksDAO;
	

	@Override
	public void insert(Books books) {
		booksDAO.insert(books);
		booksDAO.insertpur(books);
		booksDAO.updateBookNo();
		booksDAO.updatePurNo();
	}

	@Override
	public int delete(Books book) {
		return booksDAO.delete(book);
	}

	@Override
	public Books selectOne(Books book) {
		return booksDAO.selectOne(book);
	}

	@Override
	public ArrayList<Books> selectAll(Books books) {
		return booksDAO.selectAll(books);
	}

	@Override
	public void update(Books books) {
		booksDAO.update(books);
	}

	@Override
	public void insertAudio(Books books) {
		booksDAO.insertAudio(books);
		booksDAO.insertpur(books);
		booksDAO.updateBookNo();
		booksDAO.updatePurNo();
		
	}
}
