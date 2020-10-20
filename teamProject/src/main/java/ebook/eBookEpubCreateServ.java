package ebook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import nl.siegmann.epublib.domain.Author;
import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.epub.EpubWriter;

public class eBookEpubCreateServ implements Controller {
	
	public static List<String> getImgSrc(String str) { //HTML에서 img src추출하기

		Pattern nonValidPattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		List<String> result = new ArrayList<String>();

		Matcher matcher = nonValidPattern.matcher(str);

		while (matcher.find()) {

			result.add(matcher.group(1));

		}

		return result;

	}




	

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Map<String,Object>> my = null;
		String member_no = request.getParameter("member_no");
		String my_title = request.getParameter("titlee");
		String nickname = request.getParameter("nicknamee");
		
		my = EBookDAO.getInstance().selectEpubFile(member_no, my_title);
//		System.out.println(my);
//		for(int i=0; i < my.size(); i++) {
//			int bookindex = 0;
//			
//			String epubFile = (String)my.get(i).get("my_contents");
//			System.out.println(epubFile +"이펍내용");
//			
//			
//			String epubFileName = (String)my.get(i).get("my_title");
//			System.out.println(epubFileName+"이펍파일네임");
//			
//			
//			FileWriter fw = new FileWriter("C:/전자도서관/"+epubFileName+bookindex+".html" ,true);
//			fw.write(epubFile);
//			System.out.println(fw+"이건 fw고");
//			
//			fw.close();
//		
//			bookindex++;
//		}  //HTML파일 생성하는 방법 이거 건너띄워 버리고 바로 epub로 만들었음 data가지고
		
	
		//epub file 제작
		try {
			// Create new Book
			Book book = new Book();
			// Set the title
			book.getMetadata().addTitle((String)my.get(0).get("my_title"));
			// Add an Author
			book.getMetadata().addAuthor(new Author("저자 : ", (String)my.get(0).get("nickname")));
			
			// Set cover image
			//book.getMetadata().setCoverImage(new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/개미.jpg"), "cover_image"));
			List<String> imgFile = null;
			int a = 0;
			int b = 0;
			String path = request.getSession().getServletContext().getRealPath("");
			System.out.println(path + " 패스야ㅑㅑㅑㅑㅑㅑㅑㅑ");
			for(int i=0; i < my.size(); i++) {
			// Add Chapter 1
				String epubFile = (String)my.get(i).get("my_contents");
				book.addSection("chapter "+a, new Resource(epubFile.getBytes(), "chapter"+a+".html"));
				a++;
				imgFile = getImgSrc(epubFile);
				System.out.println(imgFile+"이미지파일이름");
				for(int j=0; j<imgFile.size(); j++) { //이미지 업로드
					
					File file = new File(path+imgFile.get(j));
					FileInputStream fi = new FileInputStream(file); 
					
					
					book.getResources().add(new Resource(Files.readAllBytes(file.toPath()), imgFile.get(j))); //경로 / 파일길이 / 파일이름
					//book.getResources().add(new Resource(imgFile.get(j).getBytes(), "book"+b+".jsp"));

					//book.getResources().add(new Resource(path, file.length(), imgFile.get(j))); //경로 / 파일길이 / 파일이름
					//book.getResources().add(new Resource(imgFile.get(j).getBytes(), "book"+b+".jsp"));
					//b++;

				}
			}
			
			
			
			
			// Add css파일
			book.getResources().add(new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/book.css"), "book.css"));
			book.getResources().add(new Resource(eBookEpubCreateServ.class.getResourceAsStream("/ebook/bookk.css"), "bookk.css"));
			
			
			// Add image  by Chapter 2

			// Add Chapter 2
			//TOCReference chapter2 = book.addSection("Second Chapter", new Resource("이게챕터3이다", 2, "chapter2.html"));
			 
			 
			// Add Chapter2, Section 1
			//book.addSection(chapter2, "Chapter 2, section 1", new Resource("C:/전자도서관/"+epubFileName+0+".html"));
			 
			// Add Chapter 3
		//	book.addSection("Conclusion", new Resource(epubFileName+0+".html"));
			
			
			
			// Create EpubWriter
			EpubWriter epubWriter = new EpubWriter();
			 
			
			// Write the Book as Epub
				epubWriter.write(book, new FileOutputStream("C:\\Users\\admin\\git\\gitrepo\\teamProject\\src\\main\\webapp\\ebookepub\\"+(String)my.get(0).get("my_title")+".epub"));
			} catch (Exception e) {
				e.printStackTrace();
			}

	}
	

}
