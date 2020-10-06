package com.books.web;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.books.Books;
import com.books.service.BooksService;

@Controller
public class BooksController  {

    @Autowired
    BooksService booksService;
    
    
    @RequestMapping("/bookList.ad")
    public ArrayList<Books> selectAll(String search_text, String search_type){
    	return booksService.selectAll(search_text, search_type);
    }
    
    
    
}


