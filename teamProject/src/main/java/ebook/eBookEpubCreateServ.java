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

import org.apache.commons.beanutils.BeanUtils;

import common.Controller;
import createBook.CreateBookDAO;
import nl.siegmann.epublib.domain.Author;
import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.epub.EpubWriter;
import vo.Mywriting;

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
		String my_title = request.getParameter("my_title");
		String contents = request.getParameter("editor1");
		String nickname = (String)request.getSession().getAttribute("nickname");
		String member_no =(String)request.getSession().getAttribute("member_no");
		Mywriting  mywriting = new Mywriting();
		try {
			BeanUtils.copyProperties(mywriting, request.getParameterMap());
		}catch(Exception e) {
			e.printStackTrace();
		}
		//contents는 변환 한 다음 epub_path에 담아주기.(upload)
		
		mywriting.setMember_no(member_no);
		mywriting.setMy_contents(contents);
		CreateBookDAO.getInstance().saveUserBook(mywriting);
		CreateBookDAO.getInstance().updateUserBook(mywriting);
		
		my = EBookDAO.getInstance().selectEpubFile(member_no, my_title);
		String genre = (String)my.get(0).get("genre");
		String image_uri = (String)my.get(0).get("image_uri");
		String my_summary = (String)my.get(0).get("my_summary");
		String my_introduction = (String)my.get(0).get("my_introduction");
		String epub_path = my_title+".epub";
		EBookDAO.getInstance().CreateEpubAfterInsert(my_title,  nickname, epub_path, member_no,  genre,  image_uri,  my_summary,  my_introduction);
		
		
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
			Book book = new Book();
			//제목
			book.getMetadata().addTitle((String)my.get(0).get("my_title"));
			//저자 
			book.getMetadata().addAuthor(new Author("저자 : ", (String)my.get(0).get("nickname")));
			List<String> imgFile = null;
			int a = 0;
			String path = request.getSession().getServletContext().getRealPath("");
			for(int i=0; i < my.size(); i++) {
			// 챕터추가
				String epubFile = (String)my.get(i).get("my_contents");
				book.addSection("chapter "+a, new Resource(epubFile.getBytes(), "chapter"+a+".html"));
				a++;
				imgFile = getImgSrc(epubFile);
				System.out.println(imgFile+"이미지파일이름");
				for(int j=0; j<imgFile.size(); j++) { //이미지 업로드	
					File file = new File(path+imgFile.get(j)); 
					book.getResources().add(new Resource(Files.readAllBytes(file.toPath()), imgFile.get(j))); //경로 / 파일길이 / 파일이름
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
		
		response.sendRedirect("main.do");
	}
	

}
