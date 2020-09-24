package bookManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import common.Controller;
import vo.Books;

public class BookModifyServ implements Controller
{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Books book = new Books();
		try {
			BeanUtils.copyProperties(book, request.getParameterMap());
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		book = BookManageDAO.getInstance().update(book);
		request.getRequestDispatcher("bookList.ad").forward(request, response);

	}

}
