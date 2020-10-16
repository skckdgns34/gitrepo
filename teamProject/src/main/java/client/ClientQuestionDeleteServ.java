package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookManage.BookManageDAO;
import common.Controller;
import vo.Questions;

public class ClientQuestionDeleteServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("question_no");


		Questions question = new Questions();
		question.setQuestion_no(id);

		QuestionDAO.getinstance().delete(question);
		request.getRequestDispatcher("clientQuestion.do").forward(request, response);
	}

}
