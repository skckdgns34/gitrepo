package memberManage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Questions;

public class MemberManageQuestionServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		
		List<Questions> list = QuestionDAO.getinstance().selectAll(null);
		
		request.setAttribute("list", list);

		request.getRequestDispatcher("/memberManage/memberManageQuestion.jsp").forward(request, response);
	}

}
