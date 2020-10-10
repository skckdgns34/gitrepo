package client;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Questions;

public class ClientQuestionServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		QuestionDAO qeustionDAO = new QuestionDAO();
		Questions questions = new Questions();
		
		questions.setMember_no((String)request.getSession().getAttribute("member_no"));
		
		ArrayList<Questions> list = qeustionDAO.selectAll(questions);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/client/clientQuestionList.jsp").forward(request, response);
	}

}
