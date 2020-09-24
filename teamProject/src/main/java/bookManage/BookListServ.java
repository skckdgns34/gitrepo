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
		//결과저장
		request.setAttribute("list", list);
		//페이지이동
		request.getRequestDispatcher("/bookList.jsp").forward(request, response);
	}

}
