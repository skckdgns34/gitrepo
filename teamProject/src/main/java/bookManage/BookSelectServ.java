package bookManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class BookSelectServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("book_no");
		String path = request.getParameter("epub_path");
		
		Books books = new Books();
		books.setBook_no(id);
		Books resultVO = new Books();
		resultVO = BookManageDAO.getInstance().selectOne(books);
		
		request.setAttribute("result", resultVO);
		request.getRequestDispatcher("/bookManage/bookModify.jsp").forward(request, response);

	}

}
