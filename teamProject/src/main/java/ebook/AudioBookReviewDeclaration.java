package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;

public class AudioBookReviewDeclaration implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String member_no = request.getParameter("member_no");
		String reported_member = request.getParameter("reported_member");
		String review_no = request.getParameter("review_no");
		String book_no = request.getParameter("book_no");
		String declaContents = request.getParameter("declaContents");
		String declaration_code = request.getParameter("declaration_code");
		int aa =0;
		aa =EBookDAO.getInstance().reviewDeclaration(declaration_code, declaContents, member_no, reported_member, review_no, book_no);
		response.getWriter().print(aa);
	}

}
