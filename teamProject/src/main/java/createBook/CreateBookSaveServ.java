package createBook;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import common.Controller;
import ebook.CommonDAO;
import vo.Common;
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
		book.setMember_no(member_no);
		book.setMy_contents(contents);
		CreateBookDAO.getInstance().saveUserBook(book);
		ArrayList<Common> genreList=  CommonDAO.getInstance().selectAllGenre();
		request.setAttribute("genreList", genreList);
		ArrayList<Mywriting> chapterList = CreateBookDAO.getInstance().selectAllChapter(member_no, book.getMy_title());
		request.setAttribute("chapterList", chapterList);
		request.setAttribute("title",book.getMy_title());
		request.setAttribute("intro",book.getMy_introduction());
		request.setAttribute("summary",book.getMy_summary());
		request.setAttribute("my_genre",book.getGenre());
		request.getRequestDispatcher("/createBook/createBookWrite.jsp").forward(request, response);
	}
}
