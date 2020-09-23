package bookManage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class BookListServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Books> list = BookManageDAO.getInstance().selectAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/bookManage/bookList.jsp").forward(request, response);
	}

}
