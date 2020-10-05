package bookManage;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import common.Controller;
import vo.Books;
import vo.Employees;

public class BookRegisterServ implements Controller
{

	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		
		Books book = new Books();
		
		try {
			BeanUtils.copyProperties(book, request.getParameterMap());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		Part part = request.getPart("book_img");
		String book_img = getFilename(part);
		String path = "c:/전자도서관/책표지";
		System.out.println(path);
		//파일명 중복체크
		File renameFile = FileRenamePolicy.rename(new File(path, book_img));
		part.write(path +"/" +renameFile.getName());
		if(renameFile.getName().equals("책표지1")) {
			book.setBook_img(null);
		}else {
			book.setBook_img(renameFile.getName());
		}
		
		Part part2 = request.getPart("epub_path");
		String epub_path = getFilename(part2);
		String path2 = "c:/전자도서관/전자책";
		System.out.println(path2);
		//파일명 중복체크
		File renameFile2 = FileRenamePolicy.rename(new File(path2, epub_path));
		part2.write(path2 +"/" +renameFile2.getName());
		if(renameFile2.getName().equals("전자책1")) {
			book.setEpub_path(null);
		}else {
			book.setEpub_path(renameFile2.getName());
		}
		

		
		
		
		
		int no  = BookManageDAO.getInstance().insert(book);
		
		Books book1 = new Books();
		try {
			BeanUtils.copyProperties(book1, request.getParameterMap());
		}catch(Exception e) {
			e.printStackTrace();
		}
		Employees emp = (Employees) request.getSession().getAttribute("login");
		book1.setBook_no(Integer.toString(no));
		book1.setEmp_no(emp.getEmp_no());
		
		book1 = BookManageDAO.getInstance().insertpur(book1);
		request.getRequestDispatcher("bookList.ad").forward(request, response);
	}
	
	private String getFilename(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
		if (cd.trim().startsWith("filename")) {
		return cd.substring(cd.indexOf('=') + 1).trim()
		.replace("\"", "");
		}
		}
		return null;
		}
	
	
	
}
