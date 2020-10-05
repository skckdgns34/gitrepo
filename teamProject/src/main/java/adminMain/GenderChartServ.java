package adminMain;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import memberManage.MemberManageDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GenderChartServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		List<HashMap<String, Object>> list = MemberManageDAO.getinstance().getGenderCnt();
		
		String result = JSONArray.fromObject(list).toString();
		response.getWriter().print(result);

	
	}

}
