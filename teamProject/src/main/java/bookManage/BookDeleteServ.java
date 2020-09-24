package bookManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class BookDeleteServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("book_id");

		if (id.isEmpty()) {
			request.setAttribute("error", "id를 입력하세요.");
			request.getRequestDispatcher("/bookManage/bookModify.jsp").forward(request, response);
			return;
		}

		Books book = new Books();
		book.setBook_no(id);

		int r = BookManageDAO.getInstance().delete(book);
		request.setAttribute("cnt", r);
		request.getRequestDispatcher("/bookManage/bookRegister.jsp").forward(request, response);

	}

}
