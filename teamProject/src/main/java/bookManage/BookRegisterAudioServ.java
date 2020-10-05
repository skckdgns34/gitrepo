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

public class BookRegisterAudioServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Books book = new Books();

		try {
			BeanUtils.copyProperties(book, request.getParameterMap());
		} catch (Exception e) {
			e.printStackTrace();
		}

		Part part = request.getPart("book_img");
		String book_img = getFilename(part);
		String path = "c:/전자도서관/책표지";
		System.out.println(path);
		// 파일명 중복체크
		File renameFile = FileRenamePolicy.rename(new File(path, book_img));
		part.write(path + "/" + renameFile.getName());
		if (renameFile.getName().equals("책표지1")) {
			book.setBook_img(null);
		} else {
			book.setBook_img(renameFile.getName());
		}


		Part part3 = request.getPart("audio_path");
		String audio_path = getFilename(part3);
		String path3 = "c:/전자도서관/음성책";
		System.out.println(path3);
		// 파일명 중복체크
		File renameFile3 = FileRenamePolicy.rename(new File(path3, audio_path));
		part3.write(path3 + "/" + renameFile3.getName());
		if (renameFile3.getName().equals("음성책1")) {
			book.setAudio_path(null);
		} else {
			book.setAudio_path(renameFile3.getName());
		}
		
		int no = BookManageDAO.getInstance().insert(book);
		
		Books book1 = new Books();
		try {
			BeanUtils.copyProperties(book1, request.getParameterMap());
		}catch(Exception e) {
			e.printStackTrace();
		}
		Employees emp = (Employees) request.getSession().getAttribute("login");
		book1.setBook_no(Integer.toString(no));
		book1.setEmp_no(emp.getEmp_no());
		BookManageDAO.getInstance().insert(book1);
		request.getRequestDispatcher("bookList.ad").forward(request, response);
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
