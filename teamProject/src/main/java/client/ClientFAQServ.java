package client;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.FAQ;

public class ClientFAQServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		FAQ faq = new FAQ();
		faq.setTitle(request.getParameter("title"));
		faq.setContents(request.getParameter("contents"));
		
		FAQDAO dao = new FAQDAO();
		
		ArrayList<FAQ> list = dao.selectAll(faq);
		
		request.getRequestDispatcher("client/clientFAQ.jsp").forward(request, response);
	}

}
