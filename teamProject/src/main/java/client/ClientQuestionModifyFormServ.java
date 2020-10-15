package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookManage.BookManageDAO;
import common.Controller;
import vo.Books;
import vo.Questions;

public class ClientQuestionModifyFormServ implements Controller {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("question_no");
		
		Questions questions = new Questions();
		questions.setQuestion_no(id);
		Questions resultVO = new Questions();
		resultVO = QuestionDAO.getinstance().selectOne(questions);
		
		request.setAttribute("result", resultVO);
		request.getRequestDispatcher("/client/clientQuestionModify.jsp").forward(request, response);

	}

}
