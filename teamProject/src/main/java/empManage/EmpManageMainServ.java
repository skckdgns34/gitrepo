package empManage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import vo.Employees;

public class EmpManageMainServ implements Controller
{

	public void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		
		List<Employees> list = EmpDAO.getInstance().selectAll(null);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/empManageList.jsp").forward(request, response);; //post로 보낼 때
	}

}
