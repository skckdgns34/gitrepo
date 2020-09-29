package memberManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Blacklist;

public class MemberManageBlackListPopFormServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Blacklist blackVO = new Blacklist();
		String no = request.getParameter("no");
		blackVO.setBlacklist_no(no);
		Blacklist black = BlacklistDAO.getinstance().selectOne(blackVO);
		request.setAttribute("black", black);
		
		request.getRequestDispatcher("/memberManage/memberManageBlackListPop.jsp").forward(request, response);
	}

}
