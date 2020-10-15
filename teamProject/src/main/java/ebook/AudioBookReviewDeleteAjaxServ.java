package ebook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONObject;

public class AudioBookReviewDeleteAjaxServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String review_no =  request.getParameter("review_no");
		
		int result = 0;
		
		System.out.println(review_no+"컨트롤러에서 리뷰넘버임");
		result = EBookDAO.getInstance().reviewDelete(review_no);
		
		response.getWriter().print(result);
	}	

}
