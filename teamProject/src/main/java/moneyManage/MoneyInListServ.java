package moneyManage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Purchase;

public class MoneyInListServ implements Controller
{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	String search_text = request.getParameter("search_text");
	String search_type = request.getParameter("search_type");
	List<Purchase> list = MoneyDAO.getInstance().selectAll(search_text, search_type);
	//결과저장
	request.setAttribute("list", list);
	request.setAttribute("search_type", search_type);
	request.setAttribute("search_text", search_text);
	//페이지이동
	request.getRequestDispatcher("/moneyManage/moneyInList.jsp").forward(request, response);

	}

}
