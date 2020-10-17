package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONObject;
import vo.Mylibrary;

public class AudioBookWishAjaxServ implements Controller{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("book_no");
		String id = request.getParameter("member_no");
		String check = request.getParameter("wish");
		Mylibrary wish = new Mylibrary();
		wish.setBook_no(no);
		wish.setMember_no(id);
		wish.setWish(check);
		String wishyn = EBookDAO.getInstance().bookWishUpdate(wish);
		
		response.getWriter().print(JSONObject.fromObject(wishyn)); 
	}

}
