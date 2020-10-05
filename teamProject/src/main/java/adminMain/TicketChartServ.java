package adminMain;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import memberManage.MemberManageDAO;
import net.sf.json.JSONArray;

public class TicketChartServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		List<HashMap<String, Object>> list =  MemberManageDAO.getinstance().getTicketCnt();
		
		String result = JSONArray.fromObject(list).toString();
		System.out.println(result);
		response.getWriter().print(result);

	}

}
