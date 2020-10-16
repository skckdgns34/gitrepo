package ebook;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import nl.siegmann.epublib.domain.Author;
import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.domain.TOCReference;
import nl.siegmann.epublib.epub.EpubWriter;

public class eBookEpubCreateServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			// Create new Book
			Book book = new Book();
			 
			// Set the title
			book.getMetadata().addTitle("Epublib test book 1");
			 
			// Add an Author
			book.getMetadata().addAuthor(new Author("Joe", "Tester"));
			 
			// Set cover image
		//	book.getMetadata().setCoverImage(new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/개미.jpg"), "cover_image"));

			// Add Chapter 1
			book.addSection("Introduction", new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/chapter1.xhtml"), "chapter1.html"));
			
			// Add css file
			//book.getResources().add(new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/chapter1.html"), "chapter1.html"));
			 
			// Add Chapter 2
			TOCReference chapter2 = book.addSection("Second Chapter", new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/chapter1.xhtml"), "chapter1.html"));
			 
			// Add image used by Chapter 2
			book.getResources().add(new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/chapter1.xhtml"), "chapter1.html"));
			 
			// Add Chapter2, Section 1
			book.addSection(chapter2, "Chapter 2, section 1", new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/chapter1.xhtml"), "chapter1.html"));
			 
			// Add Chapter 3
			book.addSection("Conclusion", new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/chapter1.xhtml"), "chapter1.html"));
			
			
			// Create EpubWriter
			EpubWriter epubWriter = new EpubWriter();
			 
			
			// Write the Book as Epub
				epubWriter.write(book, new FileOutputStream("C:\\전자도서관/test1.epub"));
			} catch (Exception e) {
				e.printStackTrace();
			}

	}

}
