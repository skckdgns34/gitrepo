package createBook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import ebook.CommonDAO;
import vo.Common;

public class CreateBookWriteServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		
		ArrayList<Common> genreList=  CommonDAO.getInstance().selectAllGenre();
		request.setAttribute("genreList", genreList);
		request.getRequestDispatcher("/createBook/createBookWrite.jsp").forward(request, response);
	}

}
