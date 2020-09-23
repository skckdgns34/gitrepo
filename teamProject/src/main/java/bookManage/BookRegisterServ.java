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
		book.setBook_img("c:/전자도서관/책표지/"+renameFile.getName());
		
		Part part2 = request.getPart("epub_path");
		String epub_path = getFilename(part2);
		String path2 = "c:/전자도서관/전자책";
		System.out.println(path2);
		//파일명 중복체크
		File renameFile2 = FileRenamePolicy.rename(new File(path2, epub_path));
		part2.write(path2 +"/" +renameFile2.getName());
		book.setEpub_path("c:/전자도서관/전자책/"+renameFile2.getName());
		
		Part part3 = request.getPart("audio_path");
		String audio_path = getFilename(part3);
		String path3 = "c:/전자도서관/음성책";
		System.out.println(path3);
		//파일명 중복체크
		File renameFile3 = FileRenamePolicy.rename(new File(path3, audio_path));
		part3.write(path3 +"/" +renameFile3.getName());
		book.setAudio_path("c:/전자도서관/전자책/"+renameFile3.getName());

		
		
		
		Books r = BookManageDAO.getInstance().insert(book);
		request.setAttribute("cnt", r);
		request.getRequestDispatcher("/bookManage/bookRegister.jsp").forward(request, response);
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
