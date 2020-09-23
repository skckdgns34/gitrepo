package bookManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class BookModifyServ implements Controller
{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("회원정보수정");
		String id = request.getParameter("book_id");

		if(id.isEmpty()) {
			request.setAttribute("error", "책 번호를 입력하세요.");
			request.getRequestDispatcher("/bookManage/bookModify.jsp").forward(request, response);
			return;
		}
		
		Books book = new Books();
		book.setBook_no(id);
		Books resultVO = new Books();
		resultVO = BookManageDAO.getInstance().selectOne(book);
		
		request.setAttribute("result", resultVO);
		request.getRequestDispatcher("/bookManage/bookList.jsp").forward(request, response);

	}

}
