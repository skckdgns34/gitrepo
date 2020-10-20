package createBook;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import bookManage.FileRenamePolicy;
import common.Controller;
import ebook.CommonDAO;
import vo.Common;
import vo.Mywriting;

public class CreateBookSaveServ  implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contents = request.getParameter("editor1");
		String member_no =(String)request.getSession().getAttribute("member_no");
		Mywriting  book = new Mywriting();
		try {
			BeanUtils.copyProperties(book, request.getParameterMap());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		Part part = request.getPart("image_uri");
		String book_img = getFilename(part);
		String path = "c:/전자도서관/책표지";
		System.out.println(path);
		//파일명 중복체크
		File renameFile = FileRenamePolicy.rename(new File(path, book_img));
		part.write(path +"/" +renameFile.getName());
		if(renameFile.getName().equals("책표지1")) {
			book.setImage_uri(null);
		}else {
			book.setImage_uri(renameFile.getName());
		}
		
		String chapter = book.getChapter();
		book.setMember_no(member_no);
		book.setMy_contents(contents);
		
		if(chapter!=null && !chapter.equals("")) {
			CreateBookDAO.getInstance().updateUserBookDetail(book);
		}else{
			CreateBookDAO.getInstance().saveUserBook(book);
		}
		response.sendRedirect("createBook.do?title="+book.getMy_title());
	}
	private String getFilename(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}
