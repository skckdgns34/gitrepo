package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Mywriting;

public class MemberCreateBookCkServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		MywritingDAO dao = new MywritingDAO();
		Mywriting mywriting = new Mywriting();
		
		ArrayList<Mywriting> list = dao.selectAll(mywriting);
		request.setAttribute("list", list);
		request.getRequestDispatcher("member/memberCreateBookCk.jsp").forward(request, response);
	}

}
