package adminMain;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import common.Controller;
import memberManage.MemberManageDAO;
import moneyManage.MoneyDAO;
import net.sf.json.JSONArray;
import vo.Books;

public class ViewChartServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		List<Books> list = MemberManageDAO.getinstance().selectViews();
		
		String result = JSONArray.fromObject(list).toString();
		response.getWriter().print(result);

	}

}
