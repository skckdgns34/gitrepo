package createBook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import common.Controller;
import vo.Books;
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
		System.out.println(contents);
		book.setMember_no(member_no);
		book.setMy_contents(contents);
		System.out.println(book);
		CreateBookDAO.getInstance().saveUserBook(book);
		response.sendRedirect("createBookMain.do");
	}
	
}
