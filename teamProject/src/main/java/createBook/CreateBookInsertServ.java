package createBook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

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
		
		
		System.out.println(book);
		CreateBookDAO.getInstance().insertUserBook(book);
		response.sendRedirect("createBookMain.do");
	}

}
