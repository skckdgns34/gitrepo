package ebook;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import net.sf.json.JSONObject;
import vo.Good;

public class AudioBookRecommendationAjaxServ  implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String no = request.getParameter("book_no");
		String id = request.getParameter("member_no");
		String check = request.getParameter("check"); 
		System.out.println(no+"audiobookrecommen에서 북넘버");
		System.out.println(id+"audiobookrecommen에서 아이디");
		Good good = new Good();
		good.setBook_no(no);
		good.setMember_no(id);
		if(check.equals("1")) {
			EBookDAO.getInstance().recDelete(good);
			check = "0";
		}else{
			EBookDAO.getInstance().recInsert(good);
			check = "1";
		}
		int count = EBookDAO.getInstance().recCount(no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("check", check);
		map.put("count", count);
		response.getWriter().print(JSONObject.fromObject(map)); 
		
		
	}
}
