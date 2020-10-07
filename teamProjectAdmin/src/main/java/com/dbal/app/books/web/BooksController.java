package com.dbal.app.books.web;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dbal.app.books.Books;
import com.dbal.app.books.service.BooksService;
import com.dbal.app.common.FileRenamePolicy;
import com.dbal.app.empManage.Employees;

@Controller
public class BooksController  {

    @Autowired
    BooksService booksService;
    
    //전체도서 조회
    @RequestMapping("/bookList.ad")
    public String selectAll(Model model,Books books){
    	model.addAttribute("list",booksService.selectAll(books));
    	return "bookManage/bookList";
    }
    
    //e-book 등록 페이지
    @RequestMapping(value = "/bookManage.ad", method = RequestMethod.GET)
    public String BookManageServ() {
    	return "bookManage/bookRegister";
    }
    
    //e-book 등록
    @RequestMapping(value = "/bookRegister.ad", method = RequestMethod.POST)
    public String BookRegisterServ(Books books, HttpServletRequest request) throws IllegalStateException, IOException {
    	
    	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
    	//표지 업로드
    	MultipartFile imgFile = multipartRequest.getFile("book_img1");
		String path = "c:/전자도서관/책표지";
		String fileName;
		System.out.println(path);
		if(imgFile !=null && !imgFile.isEmpty() && imgFile.getSize()>0) {
			fileName = imgFile.getOriginalFilename();
			//파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path, fileName));
			imgFile.transferTo(new File(path,renameFile.getName()));
			books.setBook_img(renameFile.getName());
		}
		
		//Ebook 업로드
		MultipartFile epubFile = multipartRequest.getFile("epub_path1");
		String path2 = "c:/전자도서관/전자책";
		System.out.println(path2);
		if(epubFile !=null && !epubFile.isEmpty() && epubFile.getSize()>0) {
			fileName = epubFile.getOriginalFilename();
			//파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path2, fileName));
			epubFile.transferTo(new File(path2,renameFile.getName()));
			books.setEpub_path(renameFile.getName());
		}
		
		//등록처리
		Employees emp = (Employees) request.getSession().getAttribute("login");
		books.setEmp_no(emp.getEmp_no());
		booksService.insert(books);
    	return "redirect:/bookList.ad";
    }
    
    //오디오북 등록 페이지
    @RequestMapping(value = "/bookManageAudio.ad", method = RequestMethod.GET)
    public String BookManageAudioServ() {
    	return "bookManage/bookRegisterAudio";
    }
    
    //오디오북 등록 
    @RequestMapping(value = "/bookRegisterAudio.ad", method = RequestMethod.POST)
    public String BookRegisterAudioServ(Books books, HttpServletRequest request) throws IllegalStateException, IOException {
    	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
    	//표지 업로드
    	MultipartFile imgFile = multipartRequest.getFile("book_img1");
		String path = "c:/전자도서관/책표지";
		String fileName;
		if(imgFile !=null && !imgFile.isEmpty() && imgFile.getSize()>0) {
			fileName = imgFile.getOriginalFilename();
			//파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path, fileName));
			imgFile.transferTo(new File(path,renameFile.getName()));
			books.setBook_img(renameFile.getName());
		}
		
		//Audiobook 업로드
		MultipartFile audioFile = multipartRequest.getFile("audio_path1");
		String path2 = "c:/전자도서관/음성책";
		if(audioFile !=null && !audioFile.isEmpty() && audioFile.getSize()>0) {
			fileName = audioFile.getOriginalFilename();
			//파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path2, fileName));
			audioFile.transferTo(new File(path2,renameFile.getName()));
			books.setAudio_path(renameFile.getName());
		}
    	//등록처리
    	booksService.insertAudio(books);
    	return "redirect:/bookList.ad";
    }
    //도서삭제
    @RequestMapping("/bookDelete.ad")
    public String BookDeleteServ(Books books) {
    	booksService.delete(books);
    	return "redirect:/bookList.ad";
    }
    
    //도서 선택
    @RequestMapping(value = "/bookSelect.ad", method = RequestMethod.GET)
    public String BookSelectServ(Model model,Books books, HttpServletRequest request) {
    	String no = request.getParameter("book_no");
    	books.setBook_no(no);
    	model.addAttribute("result",booksService.selectOne(books));
    	return "bookManage/bookModify";
    }

    //도서 수정
    @RequestMapping(value ="/bookModify.ad", method = RequestMethod.POST)
    public String BookModifyServ(Books books, HttpServletRequest request) throws IllegalStateException, IOException {
    	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
    	//표지 업로드
    	MultipartFile imgFile = multipartRequest.getFile("book_img1");
		String path = "c:/전자도서관/책표지";
		String fileName;
		if(imgFile !=null && !imgFile.isEmpty() && imgFile.getSize()>0) {
			fileName = imgFile.getOriginalFilename();
			//파일명 중복체크
			File renameFile = FileRenamePolicy.rename(new File(path, fileName));
			imgFile.transferTo(new File(path,renameFile.getName()));
			books.setBook_img(renameFile.getName());
		}
		
    	booksService.update(books);
    	return "redirect:/bookList.ad";
    }
    
}


