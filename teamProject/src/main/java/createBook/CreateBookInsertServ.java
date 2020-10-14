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

public class CreateBookInsertServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contents = request.getParameter("editor1");
		String member_no =(String)request.getSession().getAttribute("member_no");
		String nickname = (String)request.getSession().getAttribute("nickname");
		String genre = request.getParameter("genre");
		String title = request.getParameter("my_title");
		String image_uri = request.getParameter("image_uri");
		String intro = request.getParameter("my_introduction");
		String my_summary = request.getParameter("my_summary");
		Books book = new Books();
		
		System.out.println(contents);
		book.setMember_no(member_no);
		book.setWriter(nickname);
		book.setGenre(genre);
		book.setTitle(title);
		book.setBook_img(image_uri);
		book.setIntroduction(intro);
		book.setSummary(my_summary);
		//contents는 변환 한 다음 epub_path에 담아주기.(upload)
		
		
		Part part = request.getPart("image_uri");
		String book_img = getFilename(part);
		String path = "c:/전자도서관/책표지";
		// 파일명 중복체크
		File renameFile = FileRenamePolicy.rename(new File(path, book_img));
		part.write(path + "/" + renameFile.getName());
		if (renameFile.getName().equals("책표지1")) {
			book.setBook_img(null);
		} else {
			book.setBook_img(renameFile.getName());
		}
		
		
		
		System.out.println(book);
		CreateBookDAO.getInstance().insertUserBook(book);
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
