package createBook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Books;

public class CreateBookServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		Books bookDetail = new Books();
		String book_no = request.getParameter("book_no");
		
		bookDetail = CreateBookDAO.getInstance().selectedUserBook(book_no);
		request.setAttribute("bookDetail", bookDetail);
		request.getRequestDispatcher("/createBook/createBook.jsp").forward(request, response);

	}

}
