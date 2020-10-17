package ebook;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;

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
		
		List<Map<String,Object>> my = null;
		String member_no = "4";
		String my_title = "지산";
		
		my = EBookDAO.getInstance().selectEpubFile(member_no, my_title);
		System.out.println(my);
		for(int i=0; i < my.size(); i++) {
			int bookindex = 0;
			
			String epubFile = (String)my.get(i).get("my_contents");
			System.out.println(epubFile +"이펍내용");
			
			
			String epubFileName = (String)my.get(i).get("my_title");
			System.out.println(epubFileName+"이펍파일네임");
			
			
			FileWriter fw = new FileWriter("C:/전자도서관/"+epubFileName+bookindex+".html" ,true);
			fw.write(epubFile);
			System.out.println(fw+"이건 fw고");
			
			fw.close();
		
			bookindex++;
		}
		
		
		//epub file 제작
		try {
			// Create new Book
			Book book = new Book();
			// Set the title
			book.getMetadata().addTitle((String)my.get(0).get("my_title"));
			// Add an Author
			book.getMetadata().addAuthor(new Author("Nickname", (String)my.get(0).get("nickname")));
			
			// Set cover image
			//book.getMetadata().setCoverImage(new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/개미.jpg"), "cover_image"));
			
			int a = 0;
			for(int i=0; i < my.size(); i++) {
			// Add Chapter 1
			String epubFile = (String)my.get(i).get("my_contents");
			book.addSection("Introduction", new Resource(epubFile.getBytes(), "chapter"+a+".html"));
			a++;
			System.out.println("여러번들어가나??");
			}
			// Add css파일
			book.getResources().add(new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/book.css"), "book.css"));
			book.getResources().add(new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/bookk.css"), "bookk.css"));
			 
			// Add Chapter 2
			//TOCReference chapter2 = book.addSection("Second Chapter", new Resource("이게챕터3이다", 2, "chapter2.html"));
			 
			// Add image  by Chapter 2
			//book.getResources().add(new Resource("C:/전자도서관/"+epubFileName+0+".html"));
			 
			// Add Chapter2, Section 1
			//book.addSection(chapter2, "Chapter 2, section 1", new Resource("C:/전자도서관/"+epubFileName+0+".html"));
			 
			// Add Chapter 3
		//	book.addSection("Conclusion", new Resource(epubFileName+0+".html"));
			
			
			
			// Create EpubWriter
			EpubWriter epubWriter = new EpubWriter();
			 
			
			// Write the Book as Epub
				epubWriter.write(book, new FileOutputStream("C:/전자도서관/test4.epub"));
			} catch (Exception e) {
				e.printStackTrace();
			}

	}
	

}
