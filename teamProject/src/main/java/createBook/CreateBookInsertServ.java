package createBook;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import bookManage.FileRenamePolicy;
import common.Controller;
import vo.Books;
import vo.Mywriting;

public class CreateBookInsertServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contents = request.getParameter("editor1");
		String nickname = (String)request.getSession().getAttribute("nickname");
		String member_no =(String)request.getSession().getAttribute("member_no");
		Mywriting  book = new Mywriting();
		try {
			BeanUtils.copyProperties(book, request.getParameterMap());
		}catch(Exception e) {
			e.printStackTrace();
		}
		//contents는 변환 한 다음 epub_path에 담아주기.(upload)
		
		
		Part part = request.getPart("image_uri");
		String book_img = getFilename(part);
		String path = "c:/전자도서관/책표지";
		// 파일명 중복체크
		File renameFile = FileRenamePolicy.rename(new File(path, book_img));
		part.write(path + "/" + renameFile.getName());
		if (renameFile.getName().equals("책표지1")) {
			book.setImage_uri(null);
		} else {
			book.setImage_uri(renameFile.getName());
		}
		book.setMember_no(member_no);
		book.setMy_contents(contents);
		CreateBookDAO.getInstance().saveUserBook(book);
		CreateBookDAO.getInstance().updateUserBook(book);
		response.sendRedirect("createBookMain.do");
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
