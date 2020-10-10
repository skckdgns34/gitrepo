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
		Books book = new Books();
		try {
			BeanUtils.copyProperties(book, request.getParameterMap());
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(contents);
		//
		book.setMember_no(member_no);
		book.setWriter(nickname);
		book.setEpub_path(contents);
		System.out.println(book);
		//CreateBookDAO.getInstance().insertUserBook(book);
		response.sendRedirect("createBookMain.do");
	}

}
